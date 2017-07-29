function [yIndex xIndex] = find_template_2D(template, img)
    % TODO: Find template in img and return [y x] location    
    c = normxcorr2(template, img);
    [yRow xRow] = find(c == max(c(:)));
    yIndex = yRow - size(template, 1) + 1;
    xIndex = xRow - size(template, 2) + 1;    
endfunction

pkg load image;

% Test code:
tablet = imread('/images/2d.bmp');
imshow(tablet);
glyph = tablet(150:380, 152:400);
imshow(glyph);
[y x] = find_template_2D(glyph, tablet);
disp([y x]); % should be the top-left corner of template in tablet

% plot square on template
disp(size(glyph,2));

colormap('gray'), imagesc(tablet);
hold on;
plot([x x+size(glyph, 2)],[y y], 'g');
hold on;
plot([x x], [y y+size(glyph, 1)], 'g');
hold on;
plot([x+size(glyph, 2) x+size(glyph, 2)], [y y+size(glyph, 1)], 'g');
hold on;
plot([x x+size(glyph, 2)], [y+size(glyph, 1) y+size(glyph, 1)], 'g');

hold off;
