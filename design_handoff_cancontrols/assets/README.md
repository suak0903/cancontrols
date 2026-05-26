# Image assets

The CanControls site uses 12 images from `cancontrols.com`. Three ways to grab them:

## 1. Shell (fastest, macOS/Linux)
```bash
cd design_handoff_cancontrols/assets
bash download.sh
```
You'll have all 12 files locally afterward.

## 2. PowerShell (Windows)
```powershell
cd design_handoff_cancontrols\assets
# Run each line of download.sh manually, or:
$urls = @(
  @('CCLogo.png',              'https://www.cancontrols.com/wp-content/uploads/General/CCLogo.png'),
  @('Gesichtsanalyse.jpg',     'https://www.cancontrols.com/wp-content/uploads/2016/04/Gesichtsanalyse_kl.jpg'),
  @('Gestenanalyse.jpg',       'https://www.cancontrols.com/wp-content/uploads/2015/11/Gestenanalyse_klein.jpg'),
  @('Personenanalyse.jpg',     'https://www.cancontrols.com/wp-content/uploads/2016/04/Personenanalyse_kl.jpg'),
  @('Oberflaechenanalyse.jpg', 'https://www.cancontrols.com/wp-content/uploads/2015/11/Oberfl%C3%A4chenanalyse_klein.jpg'),
  @('Automobilbau.jpg',        'https://www.cancontrols.com/wp-content/uploads/2015/11/Automobilbau_klein.jpg'),
  @('Luft-und-Raumfahrt.jpg',  'https://www.cancontrols.com/wp-content/uploads/2015/11/Luft-und-Raumfahrt_klein.jpg'),
  @('Medizin.jpg',             'https://www.cancontrols.com/wp-content/uploads/2015/11/Medizin_klein.jpg'),
  @('Strassenwesen.jpg',       'https://www.cancontrols.com/wp-content/uploads/2015/11/Strassenwesen_klein.jpg'),
  @('Unterhaltung.jpg',        'https://www.cancontrols.com/wp-content/uploads/2015/11/Unterhaltung_klein.jpg'),
  @('Exponate.jpg',            'https://www.cancontrols.com/wp-content/uploads/2015/11/Exponate_klein.jpg'),
  @('Sicherheit.jpg',          'https://www.cancontrols.com/wp-content/uploads/2015/11/Sicherheit_klein.jpg')
)
foreach ($u in $urls) { Invoke-WebRequest -Uri $u[1] -OutFile $u[0] }
```

## 3. Browser (no terminal)
Open `download.html` in any browser. Each image has an **Open in tab** button — open, then `⌘/Ctrl+S`.

---

## File index

| Filename | Used in | Original URL |
|---|---|---|
| `CCLogo.png` | Nav + Footer | https://www.cancontrols.com/wp-content/uploads/General/CCLogo.png |
| `Gesichtsanalyse.jpg` | Hero bg + Tech card 01 | https://www.cancontrols.com/wp-content/uploads/2016/04/Gesichtsanalyse_kl.jpg |
| `Gestenanalyse.jpg` | Tech card 02 | https://www.cancontrols.com/wp-content/uploads/2015/11/Gestenanalyse_klein.jpg |
| `Personenanalyse.jpg` | Tech card 03 | https://www.cancontrols.com/wp-content/uploads/2016/04/Personenanalyse_kl.jpg |
| `Oberflaechenanalyse.jpg` | Tech card 04 | https://www.cancontrols.com/wp-content/uploads/2015/11/Oberflächenanalyse_klein.jpg |
| `Automobilbau.jpg` | Bereich 01 | https://www.cancontrols.com/wp-content/uploads/2015/11/Automobilbau_klein.jpg |
| `Luft-und-Raumfahrt.jpg` | Bereich 02 | https://www.cancontrols.com/wp-content/uploads/2015/11/Luft-und-Raumfahrt_klein.jpg |
| `Medizin.jpg` | Bereich 03 | https://www.cancontrols.com/wp-content/uploads/2015/11/Medizin_klein.jpg |
| `Strassenwesen.jpg` | Bereich 04 | https://www.cancontrols.com/wp-content/uploads/2015/11/Strassenwesen_klein.jpg |
| `Unterhaltung.jpg` | Bereich 05 | https://www.cancontrols.com/wp-content/uploads/2015/11/Unterhaltung_klein.jpg |
| `Exponate.jpg` | Bereich 06 | https://www.cancontrols.com/wp-content/uploads/2015/11/Exponate_klein.jpg |
| `Sicherheit.jpg` | Bereich 07 | https://www.cancontrols.com/wp-content/uploads/2015/11/Sicherheit_klein.jpg |

---

## ⚠️ Licensing

These are the **client's existing site images**. Confirm with the client they hold rights and that we may continue to use them — or replace with fresh photography for the relaunch. Faces in `Gesichtsanalyse.jpg` and `Personenanalyse.jpg` likely need a model release.
