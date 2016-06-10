`[Parent Directory] <./>`_

**Stuffs to do on a new computer**

.. contents:: **Table of Contents**
    :depth: 2

.. sectnum::
    :start: 1

####################
Softwares to install
####################
https://ninite.com/ <= comes in handy

- Chrome, Firefox, Skype, 
- JDK 8, Java 8
- WinSCP, Putty
- Dropbox, itunes, k-lite codecs
- Classic Start (for Windows 8)
- AdobeReader, SumatraPDF, PDFCreator
; # : windows key
; ^ : control key
; ! : alt key
; + : shift key

********************
The "Essentials"
********************
- cygwin 
- Sublime Text3: sublimetext.com/3
- MikTex (choose 64 bit)
- Foxitreader
- VNC for windows (exectuable in dropbox....mapped hotkey ``WIN+V`` to call)
- Office 365
- PicPick: http://www.picpick.org/en/
- QtTabbar (installer on my computer) 
- PdfFill `link <http://download.cnet.com/PDFill-PDF-Editor/3055-18497_4-10295757.html?part=dl-&tag=pdl-redir>`_
- xming
- Autohotkey http://www.autohotkey.com/

**IDE's**
- Enthrough Canopy (I like their "out-of-the-box" ipython, which i invoke from Console2)
- IntelliJ IDEA
- JetBrains
- Visual Studio Pro (from `Dreamspark <https://www.dreamspark.com/product/product.aspx?productid=93>`_)

********************
Computational
********************
- Anaconda Python
- Rstudio
- Padre: http://padre.perlide.org/

********************
Non-essentials
********************
- PDFill
- Itunes
- Logitech `Unifying <http://support.logitech.com/software/unifying>`_
- Logitech `SetPoint <http://support.logitech.com/software/setpoint>`_ (not installed on my laptops...messes up my ahk scripts)

####################
Short-cuts to add in "Startup" folder
####################
- console2
- WinSplit
- Autohotkey scripts

********************
xming
********************
- **Target**: "C:\Program Files (x86)\Xming\Xming.exe" :0 -clipboard -multiwindow -dpi 108
- **Start in**: "C:\Program Files (x86)\Xming"

####################
misc
####################
- Verify java here: http://java.com/en/download/installed.jsp
- Nice helper: http://www.saltycrane.com/blog/2007/11/cygwin-install-tips/

  (download subversion and wget on initial cygwin install; see `here <https://code.google.com/p/apt-cyg/>`_)
- ``apt-cyg install`` may give you md5sum error...replace ``md5sum`` with ``sha512sum`` in 2 lines of code in ``/usr/bin/apt-cyg``

  (`ref1 <https://github.com/transcode-open/apt-cyg/issues/37>`_, `ref2 <http://superuser.com/questions/894696/apt-cyg-install-return-md5sum-error>`_) 

********************
Username change
********************
http://answers.microsoft.com/en-us/windows/forum/windows_8-files/windows-8-user-folder-rename/3364a356-bf93-4e5c-8fcb-67850e837d6b?page=2

********************
Location of ``Normal.dotm``
********************
``C:\Users\takanori\AppData\Roaming\Microsoft\Templates``