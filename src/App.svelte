<style>
div.cardpanel {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

h1 {
  background: linear-gradient(
    90deg,
    #ff06c1 0%,
    #8705e4 25%,
    #4605ec 50%,
    #11b4f5 75%,
    #0dfdf9 100%
  );
  font-weight: bold;

  background-clip: text;
  -webkit-text-fill-color: transparent;
}
</style>

<script lang="ts">
import { shuffle } from "./shuffle";
import PictureCard from "./lib/PictureCard.svelte";
import pictureData from "./assets/pics.json";

shuffle(pictureData.pics);
</script>

<main>
  <h1>lucas shot this_</h1>

  <div class="cardpanel">
    {#each pictureData["pics"] as pic}
      <PictureCard
        src="{pic.src}"
        alt="{pic.alt}"
        title="{pic.title}"
        description="{pic.description}"
        camera="{pic.camera}"
      />
    {/each}
  </div>

  <p>
    made with &lt;3 by <a
      href="https://github.com/serramatutu"
      target="_blank"
      rel="noreferrer">@serramatutu</a
    >
  </p>
</main>
