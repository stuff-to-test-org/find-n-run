#!/bin/ash
# This file is sourced by (b)ash not run.

# Version: 1.1.0
# Author: step
# License: GPLv2
# Copyright (c)2016 step


# Installation file for the 'filmstrip' source plugin
# INSTRUCTIONS: Read file index.md, which is co-located with this file.
# Do not edit this file; copy it to your home folder and edit the new file:
#  cp -n /usr/share/doc/findnrun/examples/filmstrip/source-me.sh $HOME/

define_source_plugin () { #{{{
  local plgdir="${0%/*}/../share/doc/findnrun/examples/filmstrip"
  # This plugin provides its own help file "$plgdir/index.md"
  PLGDIR_filmstrip="$plgdir"
  SOURCE_filmstrip='filmstrip:filmstrip:filmstrip:filmstrip:filmstrip::filmstrip:filmstrip'
  TITLE_filmstrip='Filmstrip'
  TAP_filmstrip='/usr/share/doc/findnrun/examples/filmstrip/tap.sh $HOME/.filmstriprc "${term}" | findnrun-formatter --'
  DRAIN_filmstrip='show() { Xdialog --msgbox "$*" 0x0 ;} ; show'
  ## By default clicking a thumbnail simply opens a message box.
  ## Uncomment next line to have ROX-Filer open the file, presumably with
  ## the default image viewer, when you activate the search list row.
  #DRAIN_filmstrip='rox'
  ICON_filmstrip='/usr/share/doc/findnrun/examples/filmstrip/filmstrip.svg'
  INITSEARCH_filmstrip=''
  # save-filter definition {{{
    # Cf. same variable definitions in filmstrip/tap.sh
    local TMPD RESF
    TMPD="\${FNRTMP:-/tmp}/.\${ID:-filmstrip}" # deferred
    RESF="${TMPD}/.result" # search results for each ${term}
  # extract item label, image file fullpath, full exif description
  SAVEFLT_filmstrip="CUT=\"-3,-4,-5\" RDR=\"\$FNRXCLIP\" \$FNRSAVEFLT \"$RESF\""
  #}}}
}
#}}}
define_source_plugin

# 2. Enable this source: {{{2

# By adding 'filmstrip' to variable SOURCES in ~/.findnrunrc:
# . Look for SOURCES='FNRstart FNRsc' and change it to
#   SOURCES='FNRstart FNRsc filmstrip'
# . Alternatively add the above line at the bottom of ~/.findrunrc.