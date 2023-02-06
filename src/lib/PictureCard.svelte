<script lang="ts">
  export let src: string;
  export let alt: string;

  export let title: string;
  export let description: string = "";
</script>

<style>
  div {
    flex: 1 0 29%;

    margin: 10px 10px 10px 10px;

    border-radius: 8px;

    min-width: 200px;
    min-height: 200px;
    max-width: 350px;
    max-height: 350px;
    aspect-ratio: 1 / 1;

    cursor: pointer;

    /* border: 2px solid transparent; */
    transition: transform 0.2s;

    overflow: hidden;
  }

  div:hover {
    transform: scale(1.05);
  } 

  img {
    display: block;
    left: 0;
    top: 0;

    min-height: 100%;
    min-width: 100%;

    max-height: 100%;
    max-width: 100%;

    filter: grayscale(100%);

    transition: filter 0.2s;
  }

  img:hover {
    filter: grayscale(0%);
  }

  p {
    position: absolute;
  }

</style>

<div>
  <img src={src} alt={alt}>
  <!-- <h2>{title}</h2>
  <p>
    {description}
  </p> -->
</div>
