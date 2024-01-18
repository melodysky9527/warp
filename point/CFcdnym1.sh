#!/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with LZip Shell Exec <https://github.com/FajarKim/lzip-shell>
# The filename 'CFcdnym1.sh' encrypted at Thu Jan 18 05:28:03 UTC 2024
# I try invoking the compressed executable with the original name
# (for programs looking at their name).  We also try to retain the original
# file permissions on the compressed file.  For safety reasons, lzipsh will
# not create setuid or setgid shell scripts.
#
# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5
#
# Don't forget to follow me on <https://github.com/FajarKim>
skip=75

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

lztmpdir=
trap 'res=$?
  test -n "$lztmpdir" && rm -fr "$lztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  lztmpdir=`mktemp -d "${TMPDIR}lztmpXXXXXXXXX"`
else
  lztmpdir=${TMPDIR}lztmp$$; mkdir $lztmpdir
fi || { (exit 127); exit 127; }

lztmp=$lztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$lztmp" && rm -r "$lztmp";;
*/*) lztmp=$lztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | lzip -cd > "$lztmp"; then
  umask $umask
  chmod 700 "$lztmp"
  (sleep 5; rm -fr "$lztmpdir") 2>/dev/null &
  "$lztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <fajarrkim@gmail.com>."
  (exit 127); res=127
fi; exit $res
LZIP �BF=�j�g�z�����>��x{e��_P1��W�	��(�>�(C��9�C1)�5�_Q�Ygg��;o��:䈌V�{�z� R�0lB�8���p�B��� �v��bu�i�?���-�e�d��Σ�hv�.�{,H[b�ܐf(���mz�3�^O7i�ޚ��]�D��c��8���@F|~Қ{g�#]��� ��o}�$��]EU�E�q�*@���:�*`<�����~ymZ�T��޵E������u��&����u�n��s��YbfÄ�r���h[5x��/K7�]'/R�$�4q�����z��L5�	;�2�/�֑�kV���B�D�&ۀ���� �%��@�5��li���wL']��fSw�+0:��~����UB򑨿��/���Z~mR!g"����&���X,��(tR��Ϩ�#�W ����C�kf.�甑��H	_"��)��΍A 9�r.�"8�+�Bɂ�Y}YC���&� ��_�\� ؔ�5XA�� Ǡ1+�t���v���Ӄυa{�����t�:*HBU�g�o����H�o������z �r!�joM7�� ����!��;����4�@�<*Mq�?�05Dj��O���㖾n�^���������K1gZ���W]����O��n������ o�h^+�FN�kX	3�
����K8��@°_a�,�wK*�z;X`JN���?��&3�sč�r��Y�A�\���J?��G^7T�S���ׇ��w�?�	5�+�I�R'&�0��{�`��z=I-��6 ����IH���W���f
:������Yt �O�Fk�.ڡ����`����eH�ڍ�JȐY�(��[��ٲ_���;B9/,�/����)��a�� �s�;h
,�c��D�f��W]�	�	0T?y�b��j@E-���UV	��������yʢ��񮿍U#c R�a��R#��W3PHc�0i����e<��%�5��U�-2l�l�u�SD�#ƍ� ��k�K١���ʾc�X5*J*}�sn�щ���"j��&�1��BŠ�{�Ip�o13�c*�C���Q �hC���0rrcz9	C\,'JŶ53���"E��MA����_P����<͗`8%���Y�XV�C����=��ڈ) ��Y�s�d��:�II�ݡ^�e�*��aPQDHb������.uj��x�At�7(h�4��<$�<WN8
      �      