<template>
  <div id="subtitleInfoModal">
    <div id="infoContainer">
      <div id="subtitleModalExit">
        <a
          id="exit"
          href="javascript:void(0);"
          aria-label="close more information box"
          class="icon"
          @click="$emit('clickedExit')"
        >
          <font-awesome-icon icon="times" />
        </a>
      </div>
      <h2>About This Map</h2>
      <p v-if="currentFeature === 'waterStorage'">
        This is a <strong>demonstration map and is not for decision making</strong>. It shows the latest available daily estimates of natural water storage for approximately 110,000 regions across the lower forty-eight states.
        Map shading indicates the current natural water storage relative to historical conditions for this time of year.
      </p>
      <div v-if="currentFeature === 'waterTemperature'">
        <p>
          What can stream temperature tell me about water quality?​
        </p>
        <p>
          Stream temperature is one factor of overall water quality
          due to its impact on aquatic habitat. Streams naturally have different temperatures depending on how big they are, where they are located, and the time of year. However, there are also external forces that may change a stream's temperature and negatively impact aquatic life or the usability of the stream for other purposes. Learn more about these impacts below.​
        </p>
      </div>
      <div v-if="currentFeature === 'waterUse'">
        <p>
          Sed nec aliquam turpis. In tincidunt enim ac nulla suscipit, ac aliquet elit condimentum. Nullam eleifend egestas feugiat. Nullam pellentesque, nisi non consectetur vestibulum, risus libero sodales massa, vitae molestie dolor nunc eget leo. Mauris et magna eu magna scelerisque vestibulum non non metus. Cras lobortis gravida quam sit amet pharetra. In hac habitasse platea dictumst. Morbi et cursus ipsum, eu sagittis neque.
        </p>
        <p>
          Enjoy the Map!
        </p>
      </div>
      <router-link to="/questionsandanswers">
        <button
          v-ga="$ga.commands.trackName.bind(this, 'button-subtitle', 'click', 'user went to questions and answers page')"
        >
          Learn More
        </button>
      </router-link>
    </div>
  </div>
</template>
<script>
export default {
  name: "SubTitleModal",
  data() {
    return {
      currentFeature: this.$route.name
    }
  }
};
</script>
<style scoped lang="scss">
#subtitleInfoModal {
  min-height: 30px;
  margin-top: 10px;
  z-index: 1000;
  border-radius: 5px;
  border: 1px solid rgb(200, 200, 200);
  background: rgb(255, 255, 255);
  background: rgba(255, 255, 255, 0.8);

  #infoContainer {
    min-height: 20px;
    position: relative;
    padding: 5px 10px 0 10px;
    font-size: 0.9em;
    text-align: center;
    max-width: 260px;

    #subtitleModalExit{
      text-align: right;
      position: absolute;
      right: 5px;
      top: 5px;
    }

    #exit {
      display: inline-block;
      width: 25px;
      height: 100%;
      color: #000;
      cursor: pointer;
      outline: none;
      text-align: center;

      svg {
        height: 18px;
        width: 18px;
        margin: 3px 0 0 0;
      }
    }

    p {
      text-align: left;
      margin: 0 0 10px 0;
    }

    h2 {
      font-size: 1.2em;
      font-weight: bold;
      padding: 0;
      margin: 30px 0 10px 0;
    }

    button {
      margin: 0 0 10px 0;
      background: #003366;
      color: #ffffff;
      border: none;
      outline: none;
      padding: 5px 10px;
      border-radius: 5px;
      font-size: 0.9em;
      font-weight: bold;
    }
  }
}

@media screen and (min-width: 360px){
    // #subtitleInfoModal{
    //   top: 70px;
    // }
  }
</style>
