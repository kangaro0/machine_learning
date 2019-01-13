function Col = generate_colors(C)

colo = [ 
    0.5,0,0;
    0.6,0.39,0.14;
    0.5,0.5,0;
    0.9,0.098,0.29;
    0.96,0.51,0.19
];

Col = zeros(size(C,1),size(C,2),3);
for y=1:size(C,1)
    for x=1:size(C,2)
        c = C(x,y);
        Col(x,y,1) = colo(c,1);
        Col(x,y,2) = colo(c,2);
        Col(x,y,3) = colo(c,3);
    end
end

end