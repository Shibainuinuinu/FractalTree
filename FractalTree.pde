private double fractionLength = .8;
private int smallestBranch = 5;
private double branchAngle = 0.3; 
private int treeC = color(67, 184, 255);
private int choice = (int)(Math.random()*2);


public void setup()
{  
  size(640,480);    
}
public void draw()
{  
  choice = (int)(Math.random()*2);
  background(0);  
  stroke(treeC);  
  line(213, 480, 213, 430); //2
    drawBranches(213, 430, 50,3*Math.PI/2); 

  line(426, 480, 426, 430); //3
    drawBranches(426, 430, 50,3*Math.PI/2); 

  line(320,480,320,380);  //1
    drawBranches(320,380,100,3*Math.PI/2);  

}
public void drawBranches(int x,int y, double branchLength, double angle)
{    
  double angle1;
  double angle2;
  if (choice == 0){
    angle1 = angle + branchAngle*1.5;
    angle2 = angle - branchAngle;
  }
  else{
    angle1 = angle + branchAngle;
    angle2 = angle - branchAngle*1.5;
  }
  branchLength*=fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  stroke(treeC);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  if (branchLength > smallestBranch){
      drawBranches(endX1, endY1, branchLength, angle1);
      drawBranches(endX2, endY2, branchLength, angle2);
  }
  if(branchLength < smallestBranch){
    noStroke();
    fill(255);
    ellipse(endX1, endY1, 2, 2);
    ellipse(endX2, endY2, 2, 2);
    stroke(treeC);
  }
} 
