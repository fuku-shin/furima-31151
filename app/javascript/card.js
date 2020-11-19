const pay = () => {
  Payjp.setPublicKey("pk_test_d6cd7abae355a63ad3aefbe9");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("sale_address[card_number]"),
      exp_month: formData.get("sale_address[exp_month]"),
      exp_year: `20${formData.get("sale_address[exp_year]")}`,
      cvc: formData.get("sale_address[cvc]"),
      
      
    };

    console.log(card)

    Payjp.createToken(card, (status, response) => {
      console.log(response.error)
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
    });
};

window.addEventListener("load", pay);

