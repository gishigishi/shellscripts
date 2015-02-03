#!/bin/sh

src="sorce folder"
dest="backup folder"
mail_to="mail addr"

for target in $( ls -d ${src}/* ); do
  if test ${target} = "${src}/lost+found" ; then
    continue;
  fi
  /usr/bin/rsync -a ${target} ${dest}
done

mail -s "finish" ${mail_to} << EOF
backup transfer end
EOF