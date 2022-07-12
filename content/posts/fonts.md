---
author: Abdullah Khabir
layout: post
title: "How to install fonts in Linux"
date: 2019-09-18
url: fonts
description: 'Fonts'
toc: true
comments: true
tags:
  - fonts
  - linux
  - fontconfig
  - fontset
  - xset
  - xrdb
  - xresources
  - xdefaults
keywords: ["fonts in linux", "how to install fonts in linux", "install fonts linux command line", "install fonts ubuntu", "how to install fonts in linux redhat", "how to install fonts in kali linux", "linux fonts download", "install all fonts in folder linux", "centos install fonts", "linux fonts location", "fc-cache command not found", "centos 7 yum install fonts", "install all fonts in folder ubuntu", "install all fonts in folder linux", "ubuntu local font", "fc-cache skipping looped directory detected", "ubuntu install font system-wide", "ubuntu default fonts", "ubuntu fonts download", "ubuntu 18.04 font viewer", "how to install fonts in linux redhat", "ubuntu 20.04 windows fonts", "raspberry pi font manager", "install consolas font ubuntu", "linux text font download", "fonts for ubuntu", "ubuntu install microsoft fonts", "add fonts to inkscape ubuntu", "download fonts", "install arial font centos 7", "centos 7 fonts", "how to install mangal font in ubuntu", "centos install ttf fonts", "yum fonts install", "font directory centos", "linux truetype font location", "unix font path", "linux arial font path", "linux font environment variable", "location of fonts ubuntu", "where are font files in ubuntu", "fc-cache command not found", "centos 7 yum install fonts", "install all fonts in folder ubuntu", "install all fonts in folder linux", "ubuntu local font", "fc-cache skipping looped directory detected", "ubuntu install font system-wide", "ubuntu default fonts", "ubuntu fonts download", "ubuntu 18.04 font viewer", "how to install fonts in linux redhat", "ubuntu 20.04 windows fonts", "raspberry pi font manager", "install consolas font ubuntu", "linux text font download", "fonts for ubuntu", "ubuntu install microsoft fonts", "add fonts to inkscape ubuntu", "download fonts", "install arial font centos 7", "centos 7 fonts", "how to install mangal font in ubuntu", "centos install ttf fonts", "yum fonts install", "font directory centos", "linux truetype font location", "unix font path", "linux arial font path", "linux font environment variable", "location of fonts ubuntu", "where are font files in ubuntu" ]
---


I have been using different distributions in my machines. A term which is called in our linux community <b>distrohopping</b>.
On different distributions/machines, it's pain to collect packages you can't live without. For me and maybe for you too, the fonts are the part of OS which at least I care about the most.  

## Fonts path

Different linux distributions package fonts in with different names. So I decided to add the fonts to my dotfiles. And yeah now I'm happy. On any new machine/installation, I don't need to install those fonts.

Here is the path I have added the fonts which almost all distributions accept today. And it's easy to maintain them too.





```bash
$ ls ~/.local/share/fonts
 awesome                                  Tamzen7x13b.pt3
 brands                                   Tamzen7x13b.ttf
 DejaVuMathTeXGyre.ttf                    Tamzen7x13r-13.fnt
 DejaVuSans-BoldOblique.ttf               Tamzen7x13r.afm
 DejaVuSans-Bold.ttf                      Tamzen7x13r.bdf
 DejaVuSansCondensed-BoldOblique.ttf      Tamzen7x13r.dfont
 DejaVuSansCondensed-Bold.ttf             Tamzen7x13r.pcf
 DejaVuSansCondensed-Oblique.ttf          Tamzen7x13r.png
 DejaVuSansCondensed.ttf                  Tamzen7x13r.pt3
 DejaVuSans-ExtraLight.ttf                Tamzen7x13r.ttf
 DejaVuSansMono-BoldOblique.ttf           Tamzen7x14b-14.fnt
 DejaVuSansMono-Bold.ttf                  Tamzen7x14b.afm
 DejaVuSansMono-Oblique.ttf               Tamzen7x14b.bdf
 DejaVuSansMono.ttf                       Tamzen7x14b.dfont
 DejaVuSans-Oblique.ttf                   Tamzen7x14b.pcf
 DejaVuSans.ttf                           Tamzen7x14b.png
 DejaVuSerif-BoldItalic.ttf               Tamzen7x14b.pt3
 DejaVuSerif-Bold.ttf                     Tamzen7x14b.ttf
 DejaVuSerifCondensed-BoldItalic.ttf      Tamzen7x14r-14.fnt
 DejaVuSerifCondensed-Bold.ttf            Tamzen7x14r.afm
 DejaVuSerifCondensed-Italic.ttf          Tamzen7x14r.bdf
 DejaVuSerifCondensed.ttf                 Tamzen7x14r.dfont
 DejaVuSerif-Italic.ttf                   Tamzen7x14r.pcf
 DejaVuSerif.ttf                          Tamzen7x14r.png
 devicons-regular.sh                      Tamzen7x14r.pt3
 devicons-regular.ttf                     Tamzen7x14r.ttf
 DroidSansFallbackFull.ttf                Tamzen8x15b-15.fnt
'Font Awesome 5 Brands-Regular-400.otf'   Tamzen8x15b.afm
'Font Awesome 5 Free-Regular-400.otf'     Tamzen8x15b.bdf
'Font Awesome 5 Free-Solid-900.otf'       Tamzen8x15b.dfont
 fontawesome-regular.sh                   Tamzen8x15b.pcf
 fontawesome-regular.ttf                  Tamzen8x15b.png
 fontawesome-webfont.ttf                  Tamzen8x15b.pt3
 fonts.dir                                Tamzen8x15b.ttf
 Lato-BlackItalic.ttf                     Tamzen8x15r-15.fnt
 Lato-Black.ttf                           Tamzen8x15r.afm
 Lato-BoldItalic.ttf                      Tamzen8x15r.bdf
 Lato-Bold.ttf                            Tamzen8x15r.dfont
 Lato-HairlineItalic.ttf                  Tamzen8x15r.pcf
 Lato-Hairline.ttf                        Tamzen8x15r.png
 Lato-HeavyItalic.ttf                     Tamzen8x15r.pt3
 Lato-Heavy.ttf                           Tamzen8x15r.ttf
 Lato-Italic.ttf                          Tamzen8x16b-16.fnt
 Lato-LightItalic.ttf                     Tamzen8x16b.afm
 Lato-Light.ttf                           Tamzen8x16b.bdf
 Lato-MediumItalic.ttf                    Tamzen8x16b.dfont
 Lato-Medium.ttf                          Tamzen8x16b.pcf
 Lato-Regular.ttf                         Tamzen8x16b.png
 Lato-SemiboldItalic.ttf                  Tamzen8x16b.pt3
 Lato-Semibold.ttf                        Tamzen8x16b.ttf
 Lato-ThinItalic.ttf                      Tamzen8x16r-16.fnt
 Lato-Thin.ttf                            Tamzen8x16r.afm
 LiberationMono-BoldItalic.ttf            Tamzen8x16r.bdf
 LiberationMono-Bold.ttf                  Tamzen8x16r.dfont
 LiberationMono-Italic.ttf                Tamzen8x16r.pcf
 LiberationMono-Regular.ttf               Tamzen8x16r.png
 LiberationSans-BoldItalic.ttf            Tamzen8x16r.pt3
 LiberationSans-Bold.ttf                  Tamzen8x16r.ttf
 LiberationSans-Italic.ttf                TamzenForPowerline10x20b-20.fnt
 LiberationSansNarrow-BoldItalic.ttf      TamzenForPowerline10x20b.afm
 LiberationSansNarrow-Bold.ttf            TamzenForPowerline10x20b.bdf
 LiberationSansNarrow-Italic.ttf          TamzenForPowerline10x20b.dfont
 LiberationSansNarrow-Regular.ttf         TamzenForPowerline10x20b.pcf
 LiberationSans-Regular.ttf               TamzenForPowerline10x20b.png
 LiberationSerif-BoldItalic.ttf           TamzenForPowerline10x20b.pt3
 LiberationSerif-Bold.ttf                 TamzenForPowerline10x20r-20.fnt
 LiberationSerif-Italic.ttf               TamzenForPowerline10x20r.afm
 LiberationSerif-Regular.ttf              TamzenForPowerline10x20r.bdf
 NafeesWeb.ttf                            TamzenForPowerline10x20r.dfont
 NotoMono-Regular.ttf                     TamzenForPowerline10x20r.pcf
 octicons-regular.sh                      TamzenForPowerline10x20r.png
 octicons-regular.ttf                     TamzenForPowerline10x20r.pt3
 pomicons-regular.sh                      TamzenForPowerline5x9b-9.fnt
 pomicons-regular.ttf                     TamzenForPowerline5x9b.afm
 Powerline10x20.bdf                       TamzenForPowerline5x9b.bdf
 Powerline5x9.bdf                         TamzenForPowerline5x9b.dfont
 Powerline6x12.bdf                        TamzenForPowerline5x9b.pcf
 Powerline7x13.bdf                        TamzenForPowerline5x9b.png
 Powerline7x14.bdf                        TamzenForPowerline5x9b.pt3
 Powerline8x15.bdf                        TamzenForPowerline5x9r-9.fnt
 Powerline8x16.bdf                        TamzenForPowerline5x9r.afm
 regular                                  TamzenForPowerline5x9r.bdf
 siji.pcf                                 TamzenForPowerline5x9r.dfont
 solid                                    TamzenForPowerline5x9r.pcf
 Symbola_Hinted.ttf                       TamzenForPowerline5x9r.png
 Symbola.ttf                              TamzenForPowerline5x9r.pt3
 Tamsyn10x20b.pcf                         TamzenForPowerline6x12b-12.fnt
 Tamsyn10x20b.psf.gz                      TamzenForPowerline6x12b.afm
 Tamsyn10x20r.pcf                         TamzenForPowerline6x12b.bdf
 Tamsyn10x20r.psf.gz                      TamzenForPowerline6x12b.dfont
 Tamsyn5x9b.pcf                           TamzenForPowerline6x12b.pcf
 Tamsyn5x9b.psf.gz                        TamzenForPowerline6x12b.png
 Tamsyn5x9r.pcf                           TamzenForPowerline6x12b.pt3
 Tamsyn5x9r.psf.gz                        TamzenForPowerline6x12r-12.fnt
 Tamsyn6x12b.pcf                          TamzenForPowerline6x12r.afm
 Tamsyn6x12b.psf.gz                       TamzenForPowerline6x12r.bdf
 Tamsyn6x12r.pcf                          TamzenForPowerline6x12r.dfont
 Tamsyn6x12r.psf.gz                       TamzenForPowerline6x12r.pcf
 Tamsyn7x13b.pcf                          TamzenForPowerline6x12r.png
 Tamsyn7x13b.psf.gz                       TamzenForPowerline6x12r.pt3
 Tamsyn7x13r.pcf                          TamzenForPowerline7x13b-13.fnt
 Tamsyn7x13r.psf.gz                       TamzenForPowerline7x13b.afm
 Tamsyn7x14b.pcf                          TamzenForPowerline7x13b.bdf
 Tamsyn7x14b.psf.gz                       TamzenForPowerline7x13b.dfont
 Tamsyn7x14r.pcf                          TamzenForPowerline7x13b.pcf
 Tamsyn7x14r.psf.gz                       TamzenForPowerline7x13b.png
 Tamsyn8x15b.pcf                          TamzenForPowerline7x13b.pt3
 Tamsyn8x15b.psf.gz                       TamzenForPowerline7x13r-13.fnt
 Tamsyn8x15r.pcf                          TamzenForPowerline7x13r.afm
 Tamsyn8x15r.psf.gz                       TamzenForPowerline7x13r.bdf
 Tamsyn8x16b.pcf                          TamzenForPowerline7x13r.dfont
 Tamsyn8x16b.psf.gz                       TamzenForPowerline7x13r.pcf
 Tamsyn8x16r.pcf                          TamzenForPowerline7x13r.png
 Tamsyn8x16r.psf.gz                       TamzenForPowerline7x13r.pt3
 Tamzen10x20b-20.fnt                      TamzenForPowerline7x14b-14.fnt
 Tamzen10x20b.afm                         TamzenForPowerline7x14b.afm
 Tamzen10x20b.bdf                         TamzenForPowerline7x14b.bdf
 Tamzen10x20b.dfont                       TamzenForPowerline7x14b.dfont
 Tamzen10x20b.pcf                         TamzenForPowerline7x14b.pcf
 Tamzen10x20b.png                         TamzenForPowerline7x14b.png
 Tamzen10x20b.pt3                         TamzenForPowerline7x14b.pt3
 Tamzen10x20b.ttf                         TamzenForPowerline7x14r-14.fnt
 Tamzen10x20r-20.fnt                      TamzenForPowerline7x14r.afm
 Tamzen10x20r.afm                         TamzenForPowerline7x14r.bdf
 Tamzen10x20r.bdf                         TamzenForPowerline7x14r.dfont
 Tamzen10x20r.dfont                       TamzenForPowerline7x14r.pcf
 Tamzen10x20r.pcf                         TamzenForPowerline7x14r.png
 Tamzen10x20r.png                         TamzenForPowerline7x14r.pt3
 Tamzen10x20r.pt3                         TamzenForPowerline8x15b-15.fnt
 Tamzen10x20r.ttf                         TamzenForPowerline8x15b.afm
 Tamzen5x9b-9.fnt                         TamzenForPowerline8x15b.bdf
 Tamzen5x9b.afm                           TamzenForPowerline8x15b.dfont
 Tamzen5x9b.bdf                           TamzenForPowerline8x15b.pcf
 Tamzen5x9b.dfont                         TamzenForPowerline8x15b.png
 Tamzen5x9b.pcf                           TamzenForPowerline8x15b.pt3
 Tamzen5x9b.png                           TamzenForPowerline8x15r-15.fnt
 Tamzen5x9b.pt3                           TamzenForPowerline8x15r.afm
 Tamzen5x9b.ttf                           TamzenForPowerline8x15r.bdf
 Tamzen5x9r-9.fnt                         TamzenForPowerline8x15r.dfont
 Tamzen5x9r.afm                           TamzenForPowerline8x15r.pcf
 Tamzen5x9r.bdf                           TamzenForPowerline8x15r.png
 Tamzen5x9r.dfont                         TamzenForPowerline8x15r.pt3
 Tamzen5x9r.pcf                           TamzenForPowerline8x16b-16.fnt
 Tamzen5x9r.png                           TamzenForPowerline8x16b.afm
 Tamzen5x9r.pt3                           TamzenForPowerline8x16b.bdf
 Tamzen5x9r.ttf                           TamzenForPowerline8x16b.dfont
 Tamzen6x12b-12.fnt                       TamzenForPowerline8x16b.pcf
 Tamzen6x12b.afm                          TamzenForPowerline8x16b.png
 Tamzen6x12b.bdf                          TamzenForPowerline8x16b.pt3
 Tamzen6x12b.dfont                        TamzenForPowerline8x16r-16.fnt
 Tamzen6x12b.pcf                          TamzenForPowerline8x16r.afm
 Tamzen6x12b.png                          TamzenForPowerline8x16r.bdf
 Tamzen6x12b.pt3                          TamzenForPowerline8x16r.dfont
 Tamzen6x12b.ttf                          TamzenForPowerline8x16r.pcf
 Tamzen6x12r-12.fnt                       TamzenForPowerline8x16r.png
 Tamzen6x12r.afm                          TamzenForPowerline8x16r.pt3
 Tamzen6x12r.bdf                          VeraBd.ttf
 Tamzen6x12r.dfont                        VeraBI.ttf
 Tamzen6x12r.pcf                          VeraIt.ttf
 Tamzen6x12r.png                          VeraMoBd.ttf
 Tamzen6x12r.pt3                          VeraMoBI.ttf
 Tamzen6x12r.ttf                          VeraMoIt.ttf
 Tamzen7x13b-13.fnt                       VeraMono.ttf
 Tamzen7x13b.afm                          VeraSeBd.ttf
 Tamzen7x13b.bdf                          VeraSe.ttf
 Tamzen7x13b.dfont                        Vera.ttf
 Tamzen7x13b.pcf                          VL-Gothic-Regular.ttf
 Tamzen7x13b.png                          VL-PGothic-Regular.ttf


``` 

There you can see directories also exist. Just make sure they are world readable. Else they won't work.


So now you have an idea how to save them. I installed them when I was on Arch Linux and never installed a single font again in my machine running Debian. 

## How to get fonts?  


Well, As I said I have installed most of the fonts from Arch Linux official/community and AUR and some I downloaded from internet different websites.
Just install them and create these directories if they already don't exist.

```bash
$ mkdir -p ~/.local/share/fonts
$ find / -name '*.ttf' -o -name '*.psf' -o -name '*.bdf' -o -name '*.fnt' -o -name '*.ttf' -o -name '*.pcf' -exec cp {} ~/.local/share/fonts \;
```

## Load/reload fonts

After copying the files, we have to load them.
   
```bash
$ fc-cache -fvv
```
## Autoload fonts on boot


Put this file in session starting file. Like .Xsession or if you're using xorg-xinit to start your Desktop Environment or Windows Manager then put it into ~/.xinitrc.

```bash
$ xset +fp ~/.local/share/fonts
$ xset fp rehash
```

Still have problems? Just lemme know in comments section and I'll be happy to assist you.
