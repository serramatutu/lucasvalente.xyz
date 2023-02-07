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

img:hover,
img:focus {
  filter: grayscale(0%);
}

p {
  position: absolute;
}
</style>

<script lang="ts">
import { onMount } from "svelte";

const MOBILE_BREAKPOINT = 576;

export let src: string;
export let alt: string;
export let camera: string;

export let title: string;
export let description: string = "";

let windowScrollY: number,
  windowWidth: number,
  windowHeight: number,
  img: HTMLImageElement,
  div: HTMLDivElement;

let cardYRelativeToCenter;
let focusPercent;

const adjustFocus = () => {
  if (windowWidth > MOBILE_BREAKPOINT) {
    return;
  }

  const cardY =
    div.getBoundingClientRect().y + div.getBoundingClientRect().height / 2;
  cardYRelativeToCenter = cardY - windowHeight / 2;
  const focusRegionHeight = windowHeight / 6;

  const distance = Math.abs(cardYRelativeToCenter);

  focusPercent =
    distance <= focusRegionHeight / 2
      ? 1
      : distance > windowHeight / 2
      ? 0
      : 1 -
        (2 * (distance - focusRegionHeight / 2)) /
          (windowHeight - focusRegionHeight);

  img.style.filter = `grayscale(${(1 - focusPercent) * 100}%)`;
  div.style.transform = `scale(${1 + focusPercent * 0.05})`;
};

onMount(adjustFocus);
</script>

<svelte:window
  bind:innerWidth="{windowWidth}"
  bind:innerHeight="{windowHeight}"
  bind:scrollY="{windowScrollY}"
  on:scroll="{adjustFocus}"
/>

<div bind:this="{div}">
  <img src="{src}" alt="{alt}" bind:this="{img}" />
  <!-- <h2>{title}</h2>
  <p>
    {description}
  </p> -->
</div>
