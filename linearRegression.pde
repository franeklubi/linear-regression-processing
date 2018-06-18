
ArrayList<Float> local_xs = new ArrayList<Float>();
ArrayList<Float> local_ys = new ArrayList<Float>();

Slope slope = new Slope();

void setup(){
    size(600, 600);
    stroke(255);
}

void draw(){
    background(0);

    // printing points
    textSize(10);
    for (int i = 0; i < local_xs.size(); i++){
        float here_x = local_xs.get(i);
        float here_y = local_ys.get(i);
        ellipse(here_x, here_y, 10, 10);
        text("(" + here_x + ", " + here_y + ")", here_x+10, here_y+10);
    }

    // updating and showing the slope
    slope.update(local_xs, local_ys);
    slope.show();
    textSize(20);
    text(slope.the_slope(), 10, height-10);
}

void mousePressed(){
    local_xs.add((float)mouseX);
    local_ys.add((float)mouseY);
}