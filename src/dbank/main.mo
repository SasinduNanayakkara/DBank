import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  currentValue :=300;
  Debug.print(debug_show(currentValue));

  // let id = 34567567;

  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show(startTime));

  // Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float) {

    let temp: Float = currentValue - amount;
    if (temp>= 0) {
      currentValue  -= amount;
      Debug.print(debug_show(currentValue));
    }
    else {
      Debug.print("Amount is too large, currentValue less than zero.")
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };
  //topUp();

  public func compound() {
    let currentTime = Time.now();
    let timeElapesdNS = currentTime - startTime;
    let timeElapesdS = timeElapesdNS / 1000000000;

    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapesdS));
    startTime := currentTime;
  };

}