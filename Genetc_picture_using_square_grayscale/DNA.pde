class DNA{
  int genes[][];
  int len;
  int fitness=0;
  
  DNA(int l){
    genes=new int[l][4];
    len = l;
  }
  void generateGenes(){
    for(int i=0;i<len;i++){
      genes[i][0]= int(random(0,width));
      genes[i][1]= int(random(0,height));
      genes[i][2]= int(random(5,50));
      genes[i][3]= int(random(50));
    }
  }
  void checkFitness(PImage pic){
    int d = pic.width*pic.height;
    int score =0;
    loadPixels();
    for(int i=0;i<d;i++){
      score += abs((pixels[i] & 0xFF )-(pic.pixels[i] & 0xFF));
    }
    updatePixels();
    fitness=score;
    //println(fitness);
  }
  void copyGenes(int geneB[][]){
    for(int i=0;i<len;i++){
      genes[i]= geneB[i].clone();
    }
  }
  void mutation(){
    for(int i=0;i<mutationRate;i++){
      int j=int(random(particles));
         genes[j][0]= int(random(0,width));
          genes[j][1]= int(random(0,height));
          genes[j][2]= int(random(5,50));
          genes[j][3]= int(random(50));
    }
  }
}
