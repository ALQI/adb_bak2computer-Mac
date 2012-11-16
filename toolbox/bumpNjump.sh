#!/bin/bash

function bumpNjump()
{
   local xDimension="" yDimension="" width="" height="" OPTIND

   while getopts 'x:y:w:h:' thisArg; do
      case "${thisArg}" in
         x) xDimension="${OPTARG}" ;;
         y) yDimension="${OPTARG}" ;;
         w) width="${OPTARG}" ;;
         h) height="${OPTARG}" ;;
      esac
   done

   if [ -n "${width}" -a -n "${height}" ]; then
      echo -en '\E[4;'${height}';'${width}'t';
   fi

   if [ -n "${xDimension}" -a -n "${yDimension}" ]; then
      echo -en '\E[3;'${xDimension}';'${yDimension}'t'
   fi
}
