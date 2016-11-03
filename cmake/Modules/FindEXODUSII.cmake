# This file modified from code in the Hermes HP-FEM project
# (https://github.com/hpfem/hermes-examples/), also available under
# the GPLv3 license.
#
# Exodus2
#
# Looks for library to process exodusII files
# Needs netcdf library installed (also checked by this module)
#
 
SET(NETCDF_INCLUDE_SEARCH_PATH
	${NETCDF_ROOT}/include
	/usr/include
	/usr/local/include/
)

SET(EXODUSII_INCLUDE_SEARCH_PATH
	${EXODUSII_ROOT}/include
	/usr/include
	/usr/local/include/
)
 
IF(WIN64)
  SET(NETCDF_LIB_SEARCH_PATH ${NETCDF_ROOT}/lib/x64 ${NETCDF_ROOT}/lib /usr/lib64 /usr/lib /usr/local/lib/)
  SET(EXODUSII_LIB_SEARCH_PATH ${EXODUSII_ROOT}/lib/x64 ${EXODUSII_ROOT}/lib /usr/lib64 /usr/lib /usr/local/lib/)
ELSE(WIN64)
  SET(NETCDF_LIB_SEARCH_PATH ${NETCDF_ROOT}/lib /usr/lib64 /usr/lib /usr/local/lib/)
  SET(EXODUSII_LIB_SEARCH_PATH ${EXODUSII_ROOT}/lib /usr/lib64 /usr/lib /usr/local/lib/)
ENDIF(WIN64)
 
FIND_PATH(EXODUSII_INCLUDE_PATH exodusII.h ${EXODUSII_INCLUDE_SEARCH_PATH})
FIND_PATH(NETCDF_INCLUDE_PATH netcdf.h ${NETCDF_INCLUDE_SEARCH_PATH})

FIND_LIBRARY(NETCDF_LIBRARY netcdf ${NETCDF_LIB_SEARCH_PATH})
FIND_LIBRARY(EXODUSII_LIBRARY exoIIv2 ${EXODUSII_LIB_SEARCH_PATH})
FIND_LIBRARY(EXODUSIIFOR_LIBRARY exoIIv2for ${EXODUSII_LIB_SEARCH_PATH})
 
IF(EXODUSII_INCLUDE_PATH)
	SET(EXODUSII_INCLUDE_DIR ${EXODUSII_INCLUDE_DIR} ${EXODUSII_INCLUDE_PATH})
ENDIF(EXODUSII_INCLUDE_PATH)
 
IF(EXODUSII_LIBRARY)
	SET(EXODUSII_LIBRARIES ${EXODUSII_LIBRARIES} ${EXODUSII_LIBRARY})
ENDIF(EXODUSII_LIBRARY)

IF(EXODUSIIFOR_LIBRARY)
    SET(EXODUSII_LIBRARIES ${EXODUSII_LIBRARIES} ${EXODUSIIFOR_LIBRARY})
ENDIF(EXODUSIIFOR_LIBRARY)
 
IF(NETCDF_INCLUDE_PATH)
	SET(EXODUSII_INCLUDE_DIR ${EXODUSII_INCLUDE_DIR} ${NETCDF_INCLUDE_PATH})
	SET(NETCDF_INCLUDE_DIR ${NETCDF_INCLUDE_PATH})
ENDIF(NETCDF_INCLUDE_PATH)

IF(NETCDF_LIBRARY)
	SET(EXODUSII_LIBRARIES ${EXODUSII_LIBRARIES} ${NETCDF_LIBRARY})
ENDIF(NETCDF_LIBRARY)
 
IF(EXODUSII_INCLUDE_PATH AND EXODUSII_LIBRARY AND EXODUSIIFOR_LIBRARY AND NETCDF_INCLUDE_PATH AND NETCDF_LIBRARY)
	SET(EXODUSII_FOUND TRUE)
ENDIF(EXODUSII_INCLUDE_PATH AND EXODUSII_LIBRARY AND EXODUSIIFOR_LIBRARY AND NETCDF_INCLUDE_PATH AND NETCDF_LIBRARY)
 
INCLUDE(FindPackageHandleStandardArgs)
find_package_handle_standard_args(EXODUSII DEFAULT_MSG EXODUSII_LIBRARY EXODUSII_INCLUDE_DIR NETCDF_LIBRARY NETCDF_INCLUDE_DIR)

