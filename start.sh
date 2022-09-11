#!/bin/bash

world_name=LV-426

home_dir=$HOME/.local/share/Terraria/Worlds
mkdir -p $home_dir

if ls $home_dir/*.wld 2>/dev/null; then
  echo "Loading $world_name"
  mono --server --gc=sgen -O=all TerrariaServer.exe -configpath $home_dir -logpath $home_dir -worldname $world_name -world $home_dir/$world_name.wld
else
  echo "Creating world: $world_name"
  mono --server --gc=sgen -O=all TerrariaServer.exe -configpath $home_dir -logpath $home_dir -autocreate 3 -worldname $world_name -world $home_dir/$world_name.wld
fi
