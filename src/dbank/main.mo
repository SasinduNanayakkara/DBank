import Debug "mo:base/Debug";
import Time "mo:base/Time";

actor DBank {
  stable var currentValue = 300;
  //currentValue :=100;

  let id = 34567567;

  let startTime = Time.now();
  Debug.print(debug_show(startTime));

  // Debug.print(debug_show(id));

  public func topUp(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdrawl(amount: Nat) {

    let temp: Nat = currentValue - amount;
    if (temp>= 0) {
      currentValue  -= amount;
      Debug.print(debug_show(currentValue));
    }
    else {
      Debug.print("Amount is too large, currentValue less than zero.")
    }
  };

  public query func checkBalance(): async Nat {
    return currentValue;
  }
  //topUp();


}