clc;clear all;


m =  [
    162   151   142   132   118   108    95    88;
    85    79    83    88    99   111   124   139;
   155   162   173   183   193   199   202   201;
   198   195   192   182   174   166   155   137;
   124   113   102    92    85    87    94   101;
   104   122   138   153   165   179   189   195;
   180   206   214   216   219   218   219   207;
   171   198   192   180   166   137   133   117;
 ];

m = m-128;

I = dct_2_8x8(m,8,1);

Q = quantisation(I);

Z = zigzag_e(Q);

%ZZ = reshape(Z',1,length(Z)*length(Z));

%ZZ = [ZZ 0];

zer = zeros(1,20);

ZZ = [2 -6 zer -17 0 0 0 9 zer];

[blockACbit_seq,blockbit_len, zero_nonzero_pair] = ac_huffman(ZZ);