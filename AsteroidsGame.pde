SpaceShip ship = new SpaceShip();
Star star = new Star();
Asteroid rock = new Asteroid();
ArrayList <Asteroid> poopList = new ArrayList <Asteroid>();
Star [] spaceStars = new Star[200];



public void setup() 
{
  size(500,500);
  for(int i=0; i<spaceStars.length;i++) 
  {
    spaceStars[i]=new Star();
  }
  //for (int i=0; i<722; i<)
}

public void draw() 
{
  background(255);
  ship.show(); 
  ship.move();
  rock.show();
  rock.move();
  for(int i=0; i<spaceStars.length;i++) 
  {
    spaceStars[i].show();
  }
  //ship.directions();
  // ship.angle();

}

public void keyPressed() 
{
  if(keyPressed == true) {
    if (key == 'w') 
    {
      ship.setUp(true);
    }
    if (key == 's') 
    {
      ship.setDown(true);
    } 
    if(key=='a') 
    {
      ship.setLeft(true);          
    }
    if(key == 'd') 
    {
      ship.setRight(true);
    } 

    if (key == 'q') 
    {
            ship.setX((int)(Math.random()*501));
            ship.setY((int)(Math.random()*501));
            ship.accelerate(0);
            ship.setDirectionX(0);
            ship.setDirectionY(0);
            ship.rotate(0);
    }
  }
   //end of keyPressed == true

    if(ship.getUp()==true) {ship.accelerate(.3);}
    else{ship.accelerate(0);}

    if(ship.getDown() == true) {ship.accelerate(-.3);}
    else{ship.accelerate(0);}

    if(ship.getLeft() == true) {ship.rotate(-5);}
    else{ship.rotate(0);}

    if (ship.getRight() == true) {ship.rotate(5);}
    else {ship.rotate(0);}
}

public void keyReleased()
{
    // if (keyReleased == true)
    // {
    if (key == 'w')
    {
      ship.setUp(false);
    }
    if (key == 's') 
    {
      ship.setDown(false);
    } 
    if(key=='a') 
    {
      ship.setLeft(false);
      println ("a");   
    }
    if(key == 'd') 
    {
      ship.setRight(false);
    }
    //} 
}
//interface class --------------------------------------------------------------------------------------------------------------------------

//spaceship start ---------------------------------------------------------------------------------------------------------------------------------------
class SpaceShip extends Floater
{
  private boolean up,down,right,left;  
  public SpaceShip() {
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
    xCorners[3] = -2;
    yCorners[3] = 0;
    up = false;
    down = false;
    left = false;
    right = false;
  }

  public void angle() {
    // float xDistance = mouseX - ship.getX();
    // float yDistance = mouseY - ship.getY();
    // double angleToTurn = Math.toDegrees(Math.atan2(yDistance, xDistance));
    // ship.rotate((int)angleToTurn);
  }
  public void setUp(boolean x){up = x;}
  public Boolean getUp() {return up;}

  public void setDown(boolean y){down = y;}
  public Boolean getDown() {return down;}

  public void setRight(boolean r){right = r;}
  public Boolean getRight() {return right;}

  public void setLeft(boolean l){left = l;}
  public Boolean getLeft(){return left;}


  public void setX(int x) {myCenterX = x;} //center X
  public int getX(){return (int)(myCenterX);} 

  public void setY(int y){myCenterY = y;} //Center Y
  public int getY(){return (int)(myCenterY);}

  public void setDirectionX(double x) {myDirectionX = x;} //direction x
  public double getDirectionX() {return myDirectionX;}

  public void setDirectionY(double y) {myDirectionY = y;}//directino y
  public double getDirectionY() {return myDirectionY;}

  public void setPointDirection(int degrees){myPointDirection = degrees;} // point direction
  public double getPointDirection(){return myPointDirection;}  

}
//Spaceship end---------------------------------------------------------------------------------------------------------------------------------------------------------


class Star 
{
  private int x,y;

  public Star() 
  {
    x=(int)(Math.random()*500);
    y=(int)(Math.random()*500);
  }

  public void show() {
    fill(0);
    ellipse(x,y,2,2);
  }
}
//Star end------------------------------------------------------------------------------------------------------------------------------------------------------------

class Asteroid extends Floater
{
  public Asteroid() 
  {
    corners = 6;
    int [] xy = {-11,7,13,6,-11,5};
    int [] yx = {-8,-8,0,10,8,0};
    xCorners = xy;
    yCorners = yx;
  }

  public void setX(int x) {myCenterX = x;} //center X
  public int getX(){return (int)(myCenterX);} 

  public void setY(int y){myCenterY = y;} //Center Y
  public int getY(){return (int)(myCenterY);}

  public void setDirectionX(double x) {myDirectionX = x;} //direction x
  public double getDirectionX() {return myDirectionX;}

  public void setDirectionY(double y) {myDirectionY = y;}//directino y
  public double getDirectionY() {return myDirectionY;}

  public void setPointDirection(int degrees){myPointDirection = degrees;} // point direction
  public double getPointDirection(){return myPointDirection;}

}
//Asteroid end----------------------------------------------------------------------------------------------------------------------------------------------------------
 


abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   

  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   //move the floater in the current direction of travel
  public void move ()   
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }  
  //Draws the floater at the current position
  public void show ()    
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
//abstract end

