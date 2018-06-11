/**
 * Created by Atom
 * User: Jeffrey Kragten
 * Date: 25-5-2018
 * Time: 12:34
 */
<div class="grid-x grid-padding-x">
  <div class="small-12">
    <div class="orbit" role="region" aria-label="Favorite Space Pictures" data-orbit>
      <div class="orbit-wrapper">
        <div class="orbit-controls">
          <button class="orbit-previous"><span class="show-for-sr">Previous Slide</span>&#9664;&#xFE0E;</button>
          <button class="orbit-next"><span class="show-for-sr">Next Slide</span>&#9654;&#xFE0E;</button>
        </div>
        <ul class="orbit-container">
          <li class="is-active orbit-slide">
            <figure class="orbit-figure">
              <img class="orbit-image" src="img/veilingen/rs6.jpg" alt="Boats">
              <figcaption class="orbit-caption">2017 Audi RS6</figcaption>
            </figure>
          </li>
          <li class="orbit-slide">
            <figure class="orbit-figure">
              <img class="orbit-image" src="img/veilingen/535i.jpg" alt="Clouds">
              <figcaption class="orbit-caption">2016 BMW 535i</figcaption>
            </figure>
          </li>
          <li class="orbit-slide">
            <figure class="orbit-figure">
              <img class="orbit-image" src="img/veilingen/reclamebordcola.jpg" alt="Water">
              <figcaption class="orbit-caption">Origineel Bord Coca Cola 1850</figcaption>
            </figure>
          </li>
        </ul>
      </div>
      <nav class="orbit-bullets">
        <button class="is-active" data-slide="0"><span class="show-for-sr">First slide details.</span><span class="show-for-sr">Current Slide</span></button>
        <button data-slide="1"><span class="show-for-sr">Second slide details.</span></button>
        <button data-slide="2"><span class="show-for-sr">Third slide details.</span></button>
      </nav>
    </div>
  </div>
</div>
