#!/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with LZip Shell Exec <https://github.com/FajarKim/lzip-shell>
# The filename 'CFcdnym1.sh' encrypted at Thu Jan 18 02:01:22 UTC 2024
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
LZIP �BF=�j�g�z�����>��x{e��_P1��W�	��(�>�(C��9�C1)�5�_Q�Ygg��;o��:䈌V�{�z� R�0lB�8���p�B��� �v��bu�i�?���-�e�d��Σ�hv�.�{,H[b�ܐf(���mz�3�^O7i�ޚ��]�D��c��8���@F|~Қ{g�#]��� ��o}�$��]EU�E�q�*@���:�*`<�����~ymZ�T��޵E������u��&����u�n��s��YbfÄ�r���h[5x��/KS!,�C_c�Y3�G���G�SbG�T �D����A�/��3��a_z��{IX�wv׼L��_�"���!�r��C��d��(��(�6��u�2��8_n�d���t�P;}���@��	��*G�!�hiKU�������u��+g��F���DHŏ����B�/^YTB���&t���	��.�~F��Z�$ߋ�/�|/�Ĳ���\ǭ�� �y�C�s��J�u��'x@�;�7�o(�pQ���h8B*x����s�n�d��z�R
�ç�)=�ۅ �
Fi�L��N��2��	$(:p���ZG�3Z$�hj�V�ZthDS3�5b�m�`h}�|}�	��~ByR�̨�+݃�'GD�A�o���&�����.��B�Oi��C����u1v6}���'`ќf���b�v
�O�֘�K�����.k0�f�� kk���O3�!H-%2��d�Oo�qPw]3�ݼL<G`O{j����y`��,FɴxdNjE �֮ 6�*M���ew-��Ԃ�_L |J�ִ��6�dE�g^��s4�){������C݂�D����~;�UJ�=p�1ϊ�VS�v-��nə�F�#f�#y������xOo�	�0�)����(�9}��ųla�j� ��!�"�#e����A�ݪ55��mR��붆E�gCY�tt�{�c�	a�Ҕn���ڍo[ %3��j�uWD+B�O� f8KuE��h��ɱ>I];zw�����U ��#�hԾ�j�����Bס^�����PU�C������OqO ���܂<��6Z�_�oy�� ��(d���A2U c"�Lj-���V4z����F�pW[!�ZO���6�bp�ol�p��ps�x�p<?sF%�.Swp�N��ۄ;��*� �lۣsp�M��3,�T� 8�F2��vSt��=��z�G�у����������_�.��r�� �.�B��)��e:����D =W	a��0�#"�ಐks�r�����A�y���o`��E(w׵"��X.�UB�'��ң|�;�@��ȏ�t@��..F�SH��F��;�m* ��{+F��D�qy��      �      