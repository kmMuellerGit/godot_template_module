#!/usr/bin/bash

# Renames 'TESTMODULE' to argument passed in.

if [ -z "$1" ]; then
    echo "rename_module.sh <new module name>"
    exit 1
fi

MY_PATH="$(dirname -- "${BASH_SOURCE[0]}")"
cd ${MY_PATH}

module_name=$1
MODULE_NAME=$(echo ${module_name} | tr '[:lower:]' '[:upper:]')
echo "Renaming contents of files..."
for f in register_types.cpp register_types.h tests/test_testmodule.h; do
    sed -i "s/TESTMODULE_REGISTER_TYPES_H/${MODULE_NAME}_REGISTER_TYPES_H/I" $f 
    sed -i "s/testmodule/${module_name}/" $f
    sed -i "s/TestModule/${module_name}/" $f
done

echo "Removing files and renaming folder to ${MODULE_NAME}_MODULE"
rm rename_module.sh
rm -rf .git .gitignore

cd ..
mv godot_template_module ${module_name}

echo "Module rename complete."