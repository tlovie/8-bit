� !  9"�1��_	
EXTRACT 8080 Ver 1.1D
01/24/86 - 02:15:00
(C) 1984, 1985, 1986 By Gil Shultz
Not for Commercial use or resale!
May be distributed freely.
 � 2) �� 2(2*2+:] � ��!� \ �͍
��x����2+�ql y����͍
��x����2*!e ~� �6L#6B#6R� :)_!\ ~��s!l ~��!s� :] � ��:m � ��:(��	:l 2��)*0}��n�8
Member file(s) not found
$1��_!2�w#�zͶ	�>�w�R>���>v���R�_	Converting ->  !�"�!C~� Ĕ#¸�_	. ~� Ĕ#���_	 to ->  �!�"��������S͔���_	
 �.	�vͣ�7��n��v}�7|�7���n�7�:m � ¥�8Extract what?   No filename was entered.
$����:�� Ĝʄ!�� 6 � 6 �!�"��2���	ʗ��	���������:�����8Internal Error, No file opened!
$:���_	
Closing ->  !�~#�@͔>:͔~͔#��> ͔:�����7��2�:*��	�� <�H�8Cannot close output file!
$:(��	������*��.�cw#"���}���o6 #�c"��>.�����:��ʪ�8Internal error, file already open!
$2�:����_	
Opening ->  !�~#�@͔>:͔~͔#��> ͔:*��	� � �� <��:��p�_	Output file exists, erase (Y/N)?  ��	�Y��_	
 ��p:��d�_	File not extracted or erased!
 > 2��2��n�� <¦�8Cannot erase output file, aborting!
$:����_	
File deleted!
 ��� <���8Cannot create output file, aborting!
$�� <�-�8Cannot open output file, aborting!
$>�2���������:�_<2� !��w�{�¡ů2��� :*��	�� <�8Cannot write output file, aborting!
$:(��	�����!\ c �!m S ��2o2�:+��	c� <���8
++Unable to open the file++
$y� c� *�+"�:y��V�8
LBR file corrupt - contact SYSOP
$y� c� *�+"�!y�n	!��n	!��n	!��n	*�|��?��_	
Extracting file:  !C~�S� Ĕ#>.͔~�S� Ĕ#¨�_	
 ^#V�"��#^#V�#"�*�)|2o}2�c� >�2A!x"?�*?#"?:A<2A���~�ɯ2A!x"?*�+"�}��4:+��	y� c� ���>����	� :)_� :(��	*������c����cg�o�> 2��_	
Premature EOF on file... aborted.
 �n����_� �����:9�ʲ=29:8������������>��==29:8�28�  :7O:6�������	�O>=26yO�!����##^#Vz���y27z��>�{/�> 2��8Unexpected EOF
$�R"2�"4|����R��s#r#��R��s#r#�*4+�7	|��}���~��l	͔#�`	��~��#��~� 	#�v	�ô	�S�?ʕ	�´	#	��*.� ��".�*0#"0���*0}���	+"0*,C �",�7����_ � �������� ���������q
��m
�_	
Do you want to abort (Y/N)?  �q
��_	
 ��N�N
�Y��	�8Aborted at your request!
$�_	
Reenter input please?  ��	����� �aڂ
�z҂
�_��>
͔>�����6 #>6 #=
�ʫ
>6 #=¤
��2=/2>N#~����
#·
7���
�:>G<��
:=G���y�ڭ#~+�:��
��~Ͱ�Qҭ�@ڭ�@#ʭ#ʭ�͹�E#�*�,6?#�+ʘ͹��Owʘ�͹�Oʭ�6�H 	�ʘ�.͹ʘ#�*�z6?#�dʘ͹�kÄwʘ�Wʘ�=��͹ʘ�� #~�?¥x����7��@��{��_��=���Ä��Ͱ� ���_��.��:��;��<��>�ʘ�ژ�� !  �:=�G����2=2>�����0��:?��0�	=���~#x����                  �    6�H 	�ʘ�.͹ʘ#�*�z Shultz  Gil͹�kÄwʘ�W�       ͹ʘ�� #~�?¥x����7��@��{��_��=���Ä��Ͱ� ���_  �  12345678AB                         �8


                  ****** Syntax Error ******

Extract is a user utility designed to allow the downloading of
a '.LBR' file in its entirety and later extracting files from it.

The format of the command is as follows:

               A>EXTRACT B:ZIPPY.EXT=5 D:*.DQC =9

Where:  'A>'      is the prompt from your system
Where:  'EXTRACT' is the name of this program
Where:  ' '       (space) is mandatory
Where:  'B:'      is the drive that the library file is located [optional]
Where:  'ZIPPY'   is the library file name
Where:  'EXT'     is an optional extent. 'LBR' is the default [optional]
Where:  '=5'      is the user number the file is located at [optional]
Where:  ' '       (space) is mandatory
Where:  'D:'      is the drive the modules are to be extracted to [optional]
Where:  '*'       is the file name(s) that are to be extracted
Where:  '.DQC'    is the extension of the files to be extracted
Where:  '=9'      the user number the files are to be extracted to [optional]
$               