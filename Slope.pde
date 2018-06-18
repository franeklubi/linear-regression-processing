class Slope {

    float mean_of_xs;
    float mean_of_ys;
    float mean_of_xys;
    float squared_mean_of_xs;
    float m;
    float b;

    void update(ArrayList<Float> xs, ArrayList<Float> ys){
        mean_of_xs = this.mean(xs);
        mean_of_ys = this.mean(ys);
        mean_of_xys = this.mean(xs, ys);
        squared_mean_of_xs = this.mean_squared(xs);
        m = this.the_m(mean_of_xs, mean_of_ys, mean_of_xys, squared_mean_of_xs);
        b = this.the_b(mean_of_ys, m, mean_of_xs);
    }

    String the_slope(){
        return "y=" + this.m + "x" + "+" + this.b;
    }

    float the_m(float mean_of_xs, float mean_of_ys, float mean_of_xys, float squared_mean_of_xs){
        float m = (float) (((mean_of_xs*mean_of_ys)-mean_of_xys) / (Math.pow(mean_of_xs, 2) - squared_mean_of_xs));
        return m;
    }

    float the_b(float mean_of_ys, float the_m, float mean_of_xs){
        float b = mean_of_ys - (the_m * mean_of_xs);
        return b;
    }

    void show(){
        float x1 = 0;
        float y1 = this.b;
        float x2 = width;
        float y2 = this.m*x2 + this.b;
        line(x1, y1, x2, y2);
    }

    void slope(float the_m, float the_b){
        float x1 = 0;
        float y1 = the_b;
        float x2 = width;
        float y2 = the_m*x2 + the_b;
        line(x1, y1, x2, y2);
    }

    float mean(ArrayList<Float> values){
        float mean = 0;
        for (int i = 0; i < values.size(); i++){
            mean += values.get(i);
        }
        mean = mean / values.size();
        return mean;
    }

    float mean(ArrayList<Float> values_x, ArrayList<Float> values_y){
        float mean = 0;
        for (int i = 0; i < values_x.size(); i++){
            mean += values_x.get(i) * values_y.get(i);
        }
        mean = mean / values_x.size();
        return mean;
    }

    float mean_squared(ArrayList<Float> values){
        float mean = 0;
        for (int i = 0; i < values.size(); i++){
            mean += Math.pow(values.get(i), 2);
        }
        mean = mean / values.size();
        return mean;
    }
}