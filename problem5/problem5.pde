    PImage img;
    PFont f;
    int status = 1;
    int firsttime = 1;
    int smallPoint, largePoint;
    float i = 0;
    int y = 0;
    float xh = 0;
    Console c = new Console(10,100,12);
    void setup()
    {
          frameRate(1000000000);
          imageMode(CENTER);
          noStroke();
          background(255);
          size(768, 432);
          c.activate();
          f = createFont("Arial",16,true); 
    }

    void draw()
    {
          if(status == 1){
          background(0);
          textFont(f);       
          fill(255);
          textAlign(CENTER);
          text("Enter the image name with extension to see the animation",width/2,200);
          textAlign(CENTER);
          text("but make sure that image is copied into same directory as that of code",width/2,220); 
          textAlign(CENTER);
          text("Try drogon.jpg or open problem5 directory to see available images",width/2,240);
          c.display();
          }
          else if(firsttime == 1){
          img = loadImage(c.chars);
          img.resize(768,432);
          firsttime = 0;
          background(255);
          }
          else{
            int pointillize = 13;
            i = i + 0.1;
            if(i<1500){
            int x = int(random(img.width));
            int y = int(random(img.height));
            color pix = img.get(x, y);
            fill(pix, 128);
            ellipse(x, y, pointillize, pointillize);
            }
            else if(y<=img.height){
             y = y + 1;
                for (int x = 1; x < img.width-1; x++) {
                    color val = img.get(x,y);
                    fill(val,128);
                    rect(x,y,1,1);
                }
            }
            else if(xh<=img.width){
              xh = xh + 0.5;
              for (int y = 1; y < img.height-1; y++) {
                    int x1 = (int)xh;
                    color val = img.get(x1,y);
                    fill(val,128);
                    rect(xh-1,y-1,1,1);
               }
            }
            else{
              image(img,384,216);
            }
          }
    }

    void keyPressed()
    {
             if (keyAnalyzer(key).compareTo("LETTER") == 0 || keyAnalyzer(key).compareTo("NUMBER") == 0)
            {
                c.addChar(key);
            }
            if (keyCode == BACKSPACE)
            {
                c.deleteChar();
            }
            if(keyCode == ENTER)
            {
                status = 0;
            }
    }

    String keyAnalyzer(char c)
    {
        if (c == '0' || c == '1' || c == '2' || c == '3' || c == '4' || c == '5' || c == '6' || c == '7' || c == '8' || c == '9')
        {
            return "NUMBER";
        }
        else if (c == 'A' || c == 'a' || c == 'B' || c == 'b' || c == 'C' || c == 'c' || c == 'D' || c == 'd' || c == 'E' || c == 'e' ||
                 c == 'F' || c == 'f' || c == 'G' || c == 'g' || c == 'H' || c == 'h' || c == 'I' || c == 'i' || c == 'J' || c == 'j' ||
                 c == 'K' || c == 'k' || c == 'L' || c == 'l' || c == 'M' || c == 'm' || c == 'N' || c == 'n' || c == 'O' || c == 'o' ||
                 c == 'P' || c == 'p' || c == 'Q' || c == 'q' || c == 'R' || c == 'r' || c == 'S' || c == 's' || c == 'T' || c == 't' ||
                 c == 'U' || c == 'u' || c == 'V' || c == 'v' || c == 'W' || c == 'w' || c == 'X' || c == 'x' || c == 'Y' || c == 'y' ||
                 c == 'Z' || c == 'z'|| c == '.')
        {
            return "LETTER";
        }
        else
        {
            return "OTHER";
        }
    }

    class Console
    {
        float x;
        float y;
        String chars;
        int numChars;
        boolean active;
        int font;
        
        Console(float x, float y, int font)
        {
            this.x = x;
            this.y = y;
            active = false;
            this.font = font;
            chars = "";
            numChars = 0;
        }
        
        void display()
        {
            line(x,y,x,y+font);
            textSize(font);
            text(chars,x,y);
        }
        
        void addChar(char c)
        {
            chars += c;
            numChars++;
        }
        
        String readString()
        {
            return chars;
        }
        
        boolean isActive()
        {
            return active;
        }
        
        void activate()
        {
            active = true;
        }
        
        void deactivate()
        {
            active = false;
        }
        
        void reset()
        {
            chars = "";
        }
        
        void deleteChar()
        {
                if (numChars > 0)
                {        
                      chars = chars.substring(0,chars.length()-1);
                      numChars -= 1;
                }
        }
    }