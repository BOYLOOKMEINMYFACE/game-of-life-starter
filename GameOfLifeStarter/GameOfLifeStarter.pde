final int SPACING = 20; // each cell's width/height //<>// //<>//
final float DENSITY = 0.1; // how likely each cell is to be alive at the start
int[][] grid; // the 2D array to hold 0's and 1's
boolean start = false;

void setup() {
  size(800, 600); // adjust accordingly, make sure it's a multiple of SPACING
  noStroke(); // don't draw the edges of each cell
  frameRate(10); // controls speed of regeneration
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
  showGrid();
  if (start) {
    grid = calcNextGrid();
  }
}

int[][] calcNextGrid() {
  int[][] nextGrid = new int[grid.length][grid[0].length];

  // your code here

  return nextGrid;
}

int countNeighbors(int y, int x) {
  int n = 0; // don't count yourself!

  // your code here
  // don't check out-of-bounds cells

  return n;
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
