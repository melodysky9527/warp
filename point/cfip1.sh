#!/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with LZip Shell Exec <https://github.com/FajarKim/lzip-shell>
# The filename 'cfip.sh' encrypted at Wed Jan 17 08:26:40 UTC 2024
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
LZIP� �BF=�j�g�z�����>��x{e��_P1��W�	��(
��%��6���z�� 0��,+3sE�8x~�����*��Q��faو���^���p�f4���9�dRf���6�v���#j�[E���R���};�=o:W	z�$�%>v`�H%	�kI\Ҫ�))z�G��GBo�1�ې�X��I%�6薳xLǼ*T��s����|��otOX"��[jrbp4�M@�,���wi�E콴[u�f�B�V��y ��H�3��(��E���ƪ FL⬊��pMg���l\�ux�Q�^���:%C8L�`,�W�06��o�P��`��N4�[��䰑Ʉ���wm`=C8pY�:�l�e��5�!|�����a��hپ���7TT�V^I�K@ҳTE��4�����@���HZ��$��<�%��0�X��>��>������0�!A?s�8Y���s��*�uԮ��^�1�l.����aLP�	^�s�֌���$⁃�Nqò��0���nYB`s^|0��0��X���^,� |�9/��O���5T����'�CG"�9l�yW�xL~; �ɍ�Y%�����ƀ����(��[�������J��,3w���OQ �@1ڽ)��4A�rQQ�j�~��NT8;��P`�h�m��.�!W�N6��) �������
 ���5n �_p=yp��.� +$D�>�ߋ��f`���9x����.�.f<\�=�6$[�_Y�>A��6�W�6&���FL_BHPx0)3jr}㲰��ȅ�Ӄ�*l�b���^V���>����[�cQ����N^Ձ)9�;{�E3\�*��`WرEU ��҉J4��{�#!P���0�9fV�b��6�s$���5Y�qR�^S����Sq$��jA������v�ь�Ō���rs�P8�M�
��P�k'�=O/�iJ�C3�M����Ǌ	�=S�"�A��˩aQ�&cX�D_��s�4jW�w����ەn��v՟ګ���a�0���i'�{���mi�ۜ~���
�rU�͵2@�R����R�����إ|�r�&Q;�h0z��Ϛh���]8iS k�i��٬$�(����.�/���<S�XS#,����ۯ�����㩷l_��xY	~��n�	ߋXdk��^»H9�k9�h����{�>��S{z�|^�ݣ�C�9�ѻܸU�	��ȹr���H�>��C����L��RP9�l2}wT\��ؕVE�'�\x)��^�����)D$��g��4� ]�ak!��7��{]Y��{'�����$�����?��I0R�i��dl��4�:�D�y�Y��
M�ɅE�O��,����:��=��k�"3��xm�x�;��j�z3`��q��;�9,s�Ј��a8u+�\ :� ��m�;��4����7�ᘝ�
�a�J�9�W�l��������1���},� �}��H�2 �֦�*��
|Íi['�/6ʶ�&5��:9Qe·� �.kgЧm���W�|��4�s�K��_�<oR^\�A�T�6���-����K�6�Q"�2s�[�%q�C[-�R������Uau�$��P����xqUvd���ǒBQ	to�ZaMݶ����ְΑ_�V��^&��7�W�1��Ƽ��,��a�.	O,X���Fj���vV���9�WOh [��~�eD�l�U�!��{$�G�5��Z%!Z&��0�xup!~9��M���������n�'�7�D��[��Z����p��u6	Șø�rQ� [ڜ��XϜ��@k��
��`�3�L�s�#AWbn98��j�0�mR��h�]%MҐx0��X{�����ǲ��=�`���s͆G��]Ru�fSS �s��9���J׭� ����k�O�����F�3�͗���A�gi�E��6�ġ��'���1 E=$O�w����`Ă]Y#@%Ȃ�Ttq6gkT����'G����O�8�9=�����0D�.L����$r:���� ����m8�2*!�p�2��JB�+��n�U�|E'���k2�F9D��<`bl� Aڗ����@#�Nh6x^z5T��9��O�1��}�=���fi��߭��%ԉiB9$����t6=��rf1�pn���{�f	M�{����gE��=8�Xk�H�&�q?;{m�����x���M�X� �ąts�����Fk��Ԥ��n��zW�8}X��f�"܆\B�#Q
љ�5i��DwS����)Hw���ҐY���:���G����^GJx0D+O��?z5#n)X���S��O�|G���ֶ��������$ۍ�7����T$�F>���Q���)קޟ��c���=����!      W	      