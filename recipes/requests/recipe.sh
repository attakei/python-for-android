#!/bin/bash

VERSION_requests=${VERSION_requests:-2.3.0}

# dependencies of this recipe
DEPS_requests=(python)

# url of the package
URL_requests=https://pypi.python.org/packages/source/r/requests/requests-$VERSION_requests.tar.gz
# md5 of the package
MD5_requests=7449ffdc8ec9ac37bbcd286003c80f00

# default build path
BUILD_requests=$BUILD_PATH/requests/$(get_directory $URL_requests)
# default recipe path
RECIPE_requests=$RECIPES_PATH/requests

# function called for preparing source code if needed
# (you can apply patch etc here.)
function prebuild_requests() {
	true
}

# function called to build the source code
function build_requests() {
	cd $BUILD_requests

	push_arm
	# build setuptools for android
        try $BUILD_hostpython/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages

	# build setuptools for python-for-android
        try $BUILD_hostpython/hostpython setup.py install -O2 --root=$BUILD_hostpython --install-lib=Lib/site-packages
	pop_arm

}

# function called after all the compile have been done
function postbuild_requests() {
	true
}
