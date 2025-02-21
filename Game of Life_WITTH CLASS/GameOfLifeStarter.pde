final int SPACING = 10; // each cell's width/height //<>// //<>//
final float DENSITY = 0.1; // how likely each cell is to be alive at the start
Life[][] grid; // the 2D array to hold 0's and 1's
color[][] duration;
boolean start = false;
int bg = 0;

void setup() {
  size(800, 600); // adjust accordingly, make sure it's a multiple of SPACING
  noStroke(); // don't draw the edges of each cell
  frameRate(10); // controls speed of regeneration
  colorMode(HSB, 10);
  grid = new Life[height / SPACING][width / SPACING];
  for (int r = 0; r < grid.length; r++) {
    for (int c = 0; c < grid[0].length; c++) {
      grid[r][c] = new Life();
    }
  }
  duration = new int[height / SPACING][width / SPACING];
  // populate initial grid
  // your code here
}

void draw() {
  background(0 , 0 , bg*100);
  showGrid();
  if (start) {
    calcNextGrid();
  }
}

void keyPressed() {
  if (key == ' ') {
    start = !start;
      bg = ((bg+1) % 2);
  }
}

void mouseReleased() {
  grid[mouseY / SPACING][mouseX / SPACING].setStatus(1);
  showGrid();
}

void calcNextGrid() {
  for (int r = 0; r < grid.length; r++) {
    for (int c = 0; c < grid[0].length; c++) {
      grid[r][c].setStatus(grid[r][c].calcNextGen(countNeighbors(r , c)));
      duration[r][c] = (grid[r][c] == 1 && nextGrid[r][c] == grid[r][c]) ? min(duration[r][c] + 1, 50): 0;
    }
  }
}

int countNeighbors(int y, int x) {
  int n = 0; // don't count yourself!
  int[][] space = {{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}};
  for (int i = 0; i < space.length; i++) {
    int yIncr = space[i][0];
    int xIncr = space[i][1];
    if (checkBounds(y, x, yIncr, xIncr) && grid[y + yIncr][x + xIncr].getStatus() == 1) {
      n++;
    }
  }
  return n;
}

boolean checkBounds(int y, int x, int yIncr, int xIncr) {
  if (y+yIncr < 0 || y+yIncr >= grid.length || x+xIncr < 0 || x+xIncr >= grid[0].length) {
    return false;
  }
  return true;
}

void showGrid() {
  // your code here
  // use square() to represent each cell
  // use fill(r, g, b) to control color: black for empty, red for filled (or alive)
  for (int r = 0; r < grid.length; r++) {
    for (int c = 0; c < grid[0].length; c++) {
      if (grid[r][c].getStatus() == 1) {
        fill(calcColor(r, c));
        square(c*SPACING, r*SPACING, SPACING);
      }
    }
  }
}

color calcColor(int y, int x) {
  return color(duration[y][x] / 10, 100, 100);
}
