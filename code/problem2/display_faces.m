function display_faces(U,mu,facedim)
%{
 Display the first 10 Eigenfaces and the mean face in a single figure.

 Inputs:
   U          pca bases
   mu         mean face
   facedim    face dimension
%}
h = figure;
dim = ceil(sqrt(10));
for i = 1:11
   row = mod(i-1,dim);
col = floor((i-1) / dim);
    subplot('position', [row*(1/dim), (dim-col-1)*(1/dim), 1/dim-.001, 1/dim-0.001 ]);
    if (i==11)
         imagesc(reshape(mu, facedim));
         axis off
         break;
    end
    imagesc(reshape(U(:,i), facedim));
    axis off
end
colormap(gray);

% title('Mean and first 10 eigen faces');
saveas(h,'pca-mean-face.png','png')
