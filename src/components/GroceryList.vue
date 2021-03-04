<template>
  <div id="app">
    <h1>Grocery List</h1>
    <main class="flexbox">
      <div class="container">
        <label class="newItem" required>Add Item:</label>
        <input type="text" v-on:keyup.enter="addProduct" v-model="newItem" />
        <label class="insertAmount" required>Amount:</label>
        <input
          type="number"
          v-on:keyup.enter="addProduct"
          v-model="newAmount"
        />
        <h4>Items:</h4>
        <div id="buttons" align="left">
          <button class="sortedNames" @click="sortedNames">Sort A-Z</button>
          <button class="sortedAmount" @click="sortedAmount">
            Sort Amount
          </button>
        </div>

        <ul>
          <li
            v-for="(item, index) in itemList"
            v-bind:key="index"
            v-on:click="toggleItem(item)"
            v-bind:class="{ select: item.select }"
            class="newItem"
          >
            <span class="cbox">
              <input type="checkbox" />
            </span>

            <span>
              <label>
                <h6>name:</h6>
                {{ item.title }}
              </label>
            </span>

            <span class="slabel">
              <label>
                <h6>amount:</h6>
                {{ item.amount }}
              </label>
            </span>

            <span>
              <div class="hover">
                <img
                  @click="deleteItemFromItemList(index)"
                  src="../assets/images/arrow-204-24.png"
                  width="18"
                  height="20"
                  class="delete"
                />
              </div>
            </span>
          </li>
        </ul>

        <ul>
          <li
            v-for="(item, index) in tempItemList"
            v-bind:key="index"
            v-bind:class="{ select: item.select }"
            class="tempItem"
          >
            <span class="cbox">
              <input type="checkbox" name="packersOff" id="packers" />
            </span>

            <span class="slabel">
              <label for="packers"
                ><h6>name:</h6>
                {{ item.title }}
              </label>
            </span>

            <span class="slabel">
              <label for="packers">
                <h6>amount:</h6>
                {{ item.amount }}
              </label>
            </span>

            <span>
              <div class="hover">
                <img
                  v-on:click="deleteItemFromTempItemList(item)"
                  src="../assets/images/trash-solid-red.png"
                  width="18"
                  height="20"
                  class="delete"
                />
              </div>
            </span>
          </li>
        </ul>
      </div>
    </main>
  </div>
</template>

<script>
import { ref } from "vue";

export default {
  setup() {
    const newItem = ref("");
    const newAmount = ref("");
    const itemList = ref([
      { title: "Peer", amount: 3, select: false },
      { title: "Aardbei", amount: 4, select: false },
      { title: "Appel", amount: 2, select: false },
    ]);
    const tempItemList = ref([]);

    function addProduct() {
      this.itemList.push({ title: this.newItem, amount: this.newAmount });
    }

    function deleteItemFromItemList(index) {
      this.itemList.value.splice(index, 1);
      this.itemList = this.itemList.length;
    }

    function toggleItem(item) {
      if (item !== -1) {
        this.tempItemList.push({
          title: item.title,
          amount: item.amount,
          select: item.select,
        });
        this.itemList.splice(item, 1);
        this.item.index = -1;
        this.itemList = this.itemList.length;
        this.tempItemList = this.tempItemList.length;
      }
    }

    function deleteItemFromTempItemList(newItem) {
      this.tempItemList = this.tempItemList.filter((item) => {
        return newItem != item;
      });
    }

    function sortedNames() {
      this.itemList.sort((a, b) => {
        let fa = a.title.toUpperCase(),
          fb = b.title.toUpperCase();
        if (fa < fb) {
          return -1;
        }
        if (fa > fb) {
          return 1;
        }
        return 0;
      });
    }
    function sortedAmount() {
      this.itemList.sort((a, b) => {
        let fa = a.amount,
          fb = b.amount;
        if (fa > fb) {
          return -1;
        }
        if (fa < fb) {
          return 1;
        }
        return 0;
      });
    }

    return {
      itemList,
      tempItemList,
      newItem,
      newAmount,
      addProduct,
      toggleItem,
      sortedNames,
      sortedAmount,
      deleteItemFromTempItemList,
      deleteItemFromItemList,
    };
  },
};
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  background-color: #f3f3f3;
}

.flexbox {
  display: flex;
  justify-content: space-between;

  width: 100%;
  max-width: 768px;
  height: 100%;

  overflow: hidden;

  margin: 0 auto;
  padding: 15px;
}

.flexbox .container {
  display: flex;
  flex-direction: column;
  border-radius: 10px;

  width: 100%;
  max-width: 767px;

  background-color: #cecece;

  padding: 15px;
}

label.newItem {
  text-align: left;
  margin-top: 5px;
}

label.tempItem {
  text-align: left;
  margin-top: 5px;
}

label.insertAmount {
  text-align: left;
  margin-top: 5px;
}

.flexbox .input {
  margin-top: 5px;
}

.flexbox h4 {
  text-align: left;
  margin-top: 10px;
  padding-top: 10px;
}

.flexbox button {
  background: #fff;
  border-radius: 5px;
  flex-flow: column;
  width: 50%;
  text-align: center;
}

h6 {
  display: inline-block;
}

ul li span:nth-child(1) {
  width: 30px;
}

ul li span:nth-child(2) {
  width: 150px;
  text-align: left;
}

ul li span:nth-child(3) {
  width: 100px;
  text-align: left;
}

ul li span:nth-child(4) {
  width: 30px;
}

li.newItem {
  list-style-type: none;
  background: #fff;
  margin: 20px auto;
  padding: 10px 20px;
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

li.tempItem {
  text-decoration: line-through;
  list-style-type: none;
  background: #999;
  margin: 20px auto;
  padding: 10px 20px;
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

li.select {
  list-style-type: none;
  background: #999;
  margin: 20px auto;
  padding: 10px 20px;
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.hover:hover .delete {
  opacity: 0.5;
}

label.strikethrough + h6.strikethrough {
  list-style-type: none;
  background: #fff;
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.select {
  text-decoration: line-through;
  background: #999;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

input[type="checkbox"]:checked + label.strikethrough {
  text-decoration: line-through;
  background: #999;
  display: none;
}
</style>