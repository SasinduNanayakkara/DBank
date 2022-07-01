import {dbank} from "../../declarations/dbank";
import "../assets/main.css";
import "../assets/dbank_logo.png";

window.addEventListener("load", async function() {
    // console.log("finished loading");
    const currentAmount = await (await (dbank.checkBalance())).toFixed(2);
    document.getElementById("value").innerText = currentAmount;
});

document.querySelector("form").addEventListener("submit", async function() {
    event.preventDefault();
    // console.log("success");

    const button = event.target.querySelector("#submit-btn");

    const inputAmount = parseFloat(document.getElementById("input-amount").value);
    const withdrawalAmount = parseFloat(document.getElementById("withdrawal-amount").value);

    button.setAttribute("disabled", true);

    if (document.getElementById("input-amount").value.length != 0) {
        await dbank.topUp(inputAmount);
    }

    const currentAmount = await (await (dbank.checkBalance())).toFixed(2);
    document.getElementById("value").innerText = currentAmount;

    document.getElementById("input-amount").value = "";
    button.removeAttribute("disabled");

    if (document.getElementById("withdrawal-amount").value.length != 0) {
        await dbank.withdraw(withdrawalAmount);
    }

    const currentAmount1 = await (await (dbank.checkBalance())).toFixed(2);
    document.getElementById("value").innerText = currentAmount1;

});

