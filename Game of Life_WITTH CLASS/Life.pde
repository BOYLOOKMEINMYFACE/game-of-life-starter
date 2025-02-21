public class Life {
  private int age;
  private int status;

  public Life() {
    status = 0;
    age = 0;
  }

  private int calcNextGen(int neighbors) {
    if (status == 0 && neighbors == 3) {
      return 1;
    }
    if (status == 1 && (neighbors == 2 || neighbors == 3)) {
      return 1;
    }
    return 0;
  }

  public int getAge() {
    return age;
  }

  public int getStatus() {
    return status;
  }

  public void setStatus(int status) {
    this.status = status;
  }
}
