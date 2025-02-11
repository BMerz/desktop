set( APPLICATION_NAME       "Nextcloud" )
set( APPLICATION_SHORTNAME  "Nextcloud" )
set( APPLICATION_EXECUTABLE "nextcloud" )
set( APPLICATION_DOMAIN     "nextcloud.com" )
set( APPLICATION_VENDOR     "Nextcloud GmbH" )
set( APPLICATION_UPDATE_URL "https://updates.nextcloud.org/client/" CACHE STRING "URL for updater" )
set( APPLICATION_HELP_URL   "" CACHE STRING "URL for the help menu" )

if(APPLE AND APPLICATION_NAME STREQUAL "Nextcloud" AND EXISTS "${CMAKE_SOURCE_DIR}/theme/colored/Nextcloud-macOS-icon.svg")
    set( APPLICATION_ICON_NAME "Nextcloud-macOS" )
    message("Using macOS-specific application icon: ${APPLICATION_ICON_NAME}")
else()
    set( APPLICATION_ICON_NAME "${APPLICATION_SHORTNAME}" )
endif()

set( APPLICATION_ICON_SET   "SVG" )
set( APPLICATION_SERVER_URL "" CACHE STRING "URL for the server to use. If entered, the UI field will be pre-filled with it" )
set( APPLICATION_SERVER_URL_ENFORCE ON ) # If set and APPLICATION_SERVER_URL is defined, the server can only connect to the pre-defined URL
set( APPLICATION_REV_DOMAIN "com.nextcloud.desktopclient" )
set( APPLICATION_VIRTUALFILE_SUFFIX "nextcloud" CACHE STRING "Virtual file suffix (not including the .)")
set( APPLICATION_OCSP_STAPLING_ENABLED OFF )
set( APPLICATION_FORBID_BAD_SSL OFF )

set( LINUX_PACKAGE_SHORTNAME "nextcloud" )
set( LINUX_APPLICATION_ID "${APPLICATION_REV_DOMAIN}.${LINUX_PACKAGE_SHORTNAME}")

set( THEME_CLASS            "NextcloudTheme" )
set( WIN_SETUP_BITMAP_PATH  "${CMAKE_SOURCE_DIR}/admin/win/nsi" )

set( MAC_INSTALLER_BACKGROUND_FILE "${CMAKE_SOURCE_DIR}/admin/osx/installer-background.png" CACHE STRING "The MacOSX installer background image")

# set( THEME_INCLUDE          "${OEM_THEME_DIR}/mytheme.h" )
# set( APPLICATION_LICENSE    "${OEM_THEME_DIR}/license.txt )

option( WITH_CRASHREPORTER "Build crashreporter" OFF )
#set( CRASHREPORTER_SUBMIT_URL "https://crash-reports.owncloud.com/submit" CACHE STRING "URL for crash reporter" )
#set( CRASHREPORTER_ICON ":/owncloud-icon.png" )

## Updater options
option( BUILD_UPDATER "Build updater" ON )

option( WITH_PROVIDERS "Build with providers list" ON )

option( ENFORCE_VIRTUAL_FILES_SYNC_FOLDER "Enforce use of virtual files sync folder when available" OFF )

option( DO_NOT_USE_PROXY "Do not use system wide proxy, instead always do a direct connection to server" OFF )

## Theming options
set(NEXTCLOUD_BACKGROUND_COLOR "#0082c9" CACHE STRING "Default Nextcloud background color")
set( APPLICATION_WIZARD_HEADER_BACKGROUND_COLOR ${NEXTCLOUD_BACKGROUND_COLOR} CACHE STRING "Hex color of the wizard header background")
set( APPLICATION_WIZARD_HEADER_TITLE_COLOR "#ffffff" CACHE STRING "Hex color of the text in the wizard header")
option( APPLICATION_WIZARD_USE_CUSTOM_LOGO "Use the logo from ':/client/theme/colored/wizard_logo.(png|svg)' else the default application icon is used" ON )


#
## Windows Shell Extensions & MSI - IMPORTANT: Generate new GUIDs for custom builds with "guidgen" or "uuidgen"
#
if(WIN32)
    # Context Menu
    set( WIN_SHELLEXT_CONTEXT_MENU_GUID      "{BC6988AB-ACE2-4B81-84DC-DC34F9B24401}" )

    # Overlays
    set( WIN_SHELLEXT_OVERLAY_GUID_ERROR     "{E0342B74-7593-4C70-9D61-22F294AAFE05}" )
    set( WIN_SHELLEXT_OVERLAY_GUID_OK        "{E1094E94-BE93-4EA2-9639-8475C68F3886}" )
    set( WIN_SHELLEXT_OVERLAY_GUID_OK_SHARED "{E243AD85-F71B-496B-B17E-B8091CBE93D2}" )
    set( WIN_SHELLEXT_OVERLAY_GUID_SYNC      "{E3D6DB20-1D83-4829-B5C9-941B31C0C35A}" )
    set( WIN_SHELLEXT_OVERLAY_GUID_WARNING   "{E4977F33-F93A-4A0A-9D3C-83DEA0EE8483}" )

    # MSI Upgrade Code (without brackets)
    set( WIN_MSI_UPGRADE_CODE                "FD2FCCA9-BB8F-4485-8F70-A0621B84A7F4" )

    # CfAPI Shell Extensions
    set( CFAPI_SHELL_EXTENSIONS_LIB_NAME CfApiShellExtensions )
    
    set( CFAPI_SHELLEXT_APPID_REG "{E314A650-DCA4-416E-974E-18EA37C213EA}")
    set( CFAPI_SHELLEXT_APPID_DISPLAY_NAME "${APPLICATION_NAME} CfApi Shell Extensions" )

    set( CFAPI_SHELLEXT_THUMBNAIL_HANDLER_CLASS_ID "6FF9B5B6-389F-444A-9FDD-A286C36EA079" )
    set( CFAPI_SHELLEXT_THUMBNAIL_HANDLER_CLASS_ID_REG "{${CFAPI_SHELLEXT_THUMBNAIL_HANDLER_CLASS_ID}}" )
    set( CFAPI_SHELLEXT_THUMBNAIL_HANDLER_DISPLAY_NAME "${APPLICATION_NAME} Thumbnail Handler" )

    # Windows build options
    option( BUILD_WIN_MSI "Build MSI scripts and helper DLL" OFF )
    option( BUILD_WIN_TOOLS "Build Win32 migration tools" OFF )
endif()
