HOW-TO BUILD:
=============
** This File was Created by Playfulgod and edited by Chevanlol360 for building Carbon 4.2.2

**This short guide assumes you're on Ubuntu 11.04 or above** and have your build enviroment setup already.

Getting the (right) source
--------------------------

First, we need to create directories for the build:

    $ mkdir -p ~/bin

    $ mkdir -p ~/carbon

Now we'll need repo. Let's download it and make it executable:

    $ curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo

    $ chmod a+x ~/bin/repo

Log out and back in so the changes take effect.

Now initialized the repository and pull the source (with my repos attached):

    $ cd ~/carbon
    
    $ repo init -u git://github.com/CarbonDev/android.git -b jb2 && repo sync -f


Depending on your connection, this might take awhile since we're syncing about 21 gigs of files

Getting my ZTE Sequent repo for building carbon
  
	$ cd ~/carbon/device

	$ mkdir zte

	$ cd zte

	$ git clone https://github.com/chevanlol360/android_device_zte_warp2.git -b cm-10.1 warp2

Then Sync Playfulgods Kernel by cd'ing to the kernel directory:

	$ cd ~/carbon/kernel

	$ mkdir zte

	$ git clone https://github.com/playfulgod/kernel_zte_warp2.git warp2

Extract necessary binaries and proprietary files 
------------------------------------------------

We will need to reuse some proprietary files from the stock ROM (Need to have adb working and connect your phone up to a PC via USB.):

    $ cd
    
    $ cd ~/carbon/device/zte/warp2
    
    $ ./extract-files.sh


Getting & extracting important building Files/Folders
-----------------------------------------------------
Next we Need to Sync one more thing to prevent some simple issues while building carbon

    $ cd
    $ cd ~/carbon/device
    $ git clone https://github.com/chevanlol360/Warp2_2ndcompilation_Files.git

Last thing needed before compiling

    $ cd
    $ cd ~/carbon/vendor/carbon
    $ git clone https://github.com/chevanlol360/Get-Prebuilts-for-Carbon.git

Building
-------------
Once thats done you can start compiling.

Follow the aosp instructions on setting up the build environment. - http://source.android.com/source/download.html

When the environment is setup, we need to grab a copy of Term.apk. This is necessary to build Carbon.

    $ cd ~/carbonvendor/carbon

    $ ./get-prebuilts

Now, we build (system being your work directory):

    $ cd ~/carbon

To build for the ZTE Sequent:
    
    $ . build/envsetup.sh && brunch warp2


Installing
---------------
If the build was successful, you can now take the update zip found in out/target/product/warp2/ and flash using a custom recovery. Make sure to grab the latest Gapps to complete the experience.

When you want to rebuild with new changes to the BoardConfig.mk or after syncing to the latest CM src make sure to do the following before you recompile.

    $ make clobber
