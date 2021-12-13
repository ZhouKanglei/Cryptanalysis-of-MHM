clc; close all; clear;
addpath(genpath('lib/'));
%% Encryption
filename = 'pic';
I = imread(['images/', filename, '.bmp']); % Plain image
[ R, O, D, L, T ] = encryption( I );
%% Plot
figure;
subplot(2,3,1);imshow(I, []);title('Plain image', 'FontName', 'Times', 'FontSize', 12);
subplot(2,3,2);imshow(T, []);title('Mixed chaotic' , 'FontName', 'Times', 'FontSize', 12);
subplot(2,3,3);imshow(L, []);title('Boundary replacement', 'FontName', 'Times', 'FontSize', 12);
subplot(2,3,4);imshow(D, []);title('First level diffusion' , 'FontName', 'Times', 'FontSize', 12);
subplot(2,3,5);imshow(O, []);title('Diagonal' , 'FontName', 'Times', 'FontSize', 12);
subplot(2,3,6);imshow(R, []);title('Cipher image' , 'FontName', 'Times', 'FontSize', 12);
%% Attack
[ I_de, P, Err ]  = attack( R, I );
%% Plot
figure;
subplot(2, 2, 1);imshow(R, []);title('Cipher image' , 'FontName', 'Times', 'FontSize', 12);
subplot(2, 2, 2);imshow(P, []);title('Permutation-only', 'FontName', 'Times', 'FontSize', 12);
subplot(2, 2, 3);imshow(I_de, []);title('Decrypted', 'FontName', 'Times', 'FontSize', 12);
subplot(2, 2, 4);imshow(Err, []);title('Error', 'FontName', 'Times', 'FontSize', 12);