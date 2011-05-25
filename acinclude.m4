dnl Available from the GNU Autoconf Macro Archive at:
dnl http://www.gnu.org/software/ac-archive/htmldoc/adl_func_getopt_long.html
dnl
AC_DEFUN([adl_FUNC_GETOPT_LONG],
 [AC_PREREQ(2.49)dnl
  # clean out junk possibly left behind by a previous configuration
  rm -f lib/getopt.h
  # Check for getopt_long support
  AC_CHECK_HEADERS([getopt.h])
  AC_CHECK_FUNCS([getopt_long],,
   [# FreeBSD has a gnugetopt library for this
    AC_CHECK_LIB([gnugetopt],[getopt_long],[AC_DEFINE([HAVE_GETOPT_LONG])],
     [# use the GNU replacement
      AC_LIBOBJ(getopt)
      AC_LIBOBJ(getopt1)
      AC_CONFIG_LINKS([ggsn/getopt.h:ggsn/gnugetopt.h])
      AC_CONFIG_LINKS([sgsnemu/getopt.h:sgsnemu/gnugetopt.h])])])])
