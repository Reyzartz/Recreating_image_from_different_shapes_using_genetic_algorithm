class Population{
  int scale;
  ArrayList<DNA> population;
  Population(int scl){
    scale=scl;
    population = new ArrayList<DNA>(scl);
  }
  void initialize(){
    int i=0;
    for(DNA d:population ){
      d = new DNA(particles,i);
      d.generateGenes();
      i++;
    }
  }
  void checkFitness(){
    for(DNA d:population ){
      showResult(d.genes,particles);
      d.checkFitness(img);
    }
  }
  void reproduce(){
  }
  void findFitness(){
    int maxFitness[] ={0,0,0,0};
    for(DNA d:population ){
      int i=0;
      if(d.fitness<maxFitness[i] || maxFitness[i]==0){
        while(i>4){
          if(d.fitness>=maxFitness[i] || maxFitness[i]==0){
             maxFitness[i]=d.fitness;
          }
          i++;
        }
      }
    }
  }
}
