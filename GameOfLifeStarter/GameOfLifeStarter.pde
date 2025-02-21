final int SPACING = 20; // each cell's width/height //<>// //<>//
final float DENSITY = 0.1; // how likely each cell is to be alive at the start
int[][] grid; // the 2D array to hold 0's and 1's
boolean start = false;

void setup() {
  size(800, 600); // adjust accordingly, make sure it's a multiple of SPACING
  noStroke(); // don't draw the edges of each cell
  frameRate(5); // controls speed of regeneration
  grid = new int[height / SPACING][width / SPACING];
  // populate initial grid
  // your code here
}

void keyPressed() {
  if (key == ' ') {
    start = !start;
  }
}

void mouseClicked() {
  grid[mouseY / SPACING][mouseX / SPACING] = 1;
  showGrid();
}

void draw() {
  background(51);
  showGrid();
  if (start) {
    grid = calcNextGrid();
  }
}

int[][] calcNextGrid() {
  int[][] nextGrid = new int[grid.length][grid[0].length];
  for (int r = 0; r < grid.length; r++) {
    for (int c = 0; c < grid[0].length; c++) {
      nextGrid[r][c] = calcNextGen(r, c);
    }
  }
  // your code here
  return nextGrid;
}

int calcNextGen(int y, int x) {
  int neighbors = countNeighbors(y, x);
  if (grid[y][x] == 0 && neighbors == 3) {
    return 1;
  }
  if (grid[y][x] == 1 && (neighbors == 2 || neighbors == 3)) {
    return 1;
  }
  return 0;
}

int countNeighbors(int y, int x) {
  int n = 0; // don't count yourself!
  int[][] space = {{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}};
  for (int i = 0; i < space.length; i++) {
    int yIncr = space[i][0];
    int xIncr = space[i][1];
    if (checkBounds(y, x, yIncr, xIncr) && grid[y + yIncr][x + xIncr] == 1) {
      n++;
    }
  }
  // your code here
  // don't check out-of-bounds cells

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
      if (grid[r][c] == 1) {
        fill(255, 0, 0);
        square(c*SPACING, r*SPACING, SPACING);
      }
    }
  }
}
