# 🔊 Audio Reset Fix

Ten projekt zawiera prosty skrypt **Windows Batch (.bat)**, który naprawia problem **braku dźwięku w słuchawkach**, gdy słuchawki zostały podłączone do komputera **po** uruchomieniu aplikacji lub gry.

## 📂 Pliki

- `reset_audio.bat` – główny skrypt naprawczy

## ❓ Jaki to problem?

Jeśli uruchomię aplikację używającą wyjścia audio (najczęściej grę), a dopiero później podłączę słuchawki, dźwięk nie leci przez słuchawki. Ręczne rozwiązanie to zamknięcie aplikacji i uruchomienie jej ponownie albo zmiana urządzenia domyślnego na inne i z powrotem.

U mnie jest to utrudnione, bo monitor nie ma głośników, więc jego urządzenie audio jest w systemie **wyłączone** i nie mam między czym przełączać.

## ⚙️ Jak to działa?

Skrypt automatyzuje ręczną procedurę z ustawień dźwięku Windows:

1. Włącza urządzenie audio monitora.
2. Ustawia monitor jako domyślne urządzenie odtwarzania.
3. Wraca do słuchawek jako urządzenia domyślnego.
4. Wyłącza urządzenie audio monitora.

Dzięki temu Windows odświeża źródła dźwięku i aplikacje zaczynają grać przez słuchawki, bez restartowania gry. Całość trwa ok. 8 sekund.

## 📋 Wymagania

- Windows 10 / 11
- [SoundVolumeView](https://www.nirsoft.net/utils/sound_volume_view.html) (darmowe, przenośne narzędzie NirSoft, wystarczy plik `SoundVolumeView.exe`)
- uprawnienia administratora (skrypt sam o nie poprosi)

## 🚀 Użycie

1. Pobierz `SoundVolumeView.exe` ze strony NirSoft (wersja 64-bit ZIP) i umieść go w tym samym folderze co `reset_audio.bat`.
2. Uruchom `SoundVolumeView.exe` i skopiuj z kolumny **Name** nazwy swojego monitora i słuchawek.
3. Otwórz `reset_audio.bat` w edytorze tekstu i **wpisz nazwy swoich urządzeń** zamiast `NAZWA_MONITORA` i `NAZWA_SLUCHAWEK` na początku pliku. Skrypt nie zadziała, dopóki tego nie zrobisz. Przykład:

   ```bat
   set "MONITOR=LG ULTRAGEAR"
   set "HEADPHONES=Słuchawki"
   ```

4. Uruchom `reset_audio.bat` dwuklikiem i zatwierdź prośbę o uprawnienia administratora.

## 💡 Wskazówki

- Jeśli skrypt nie znajduje urządzenia, użyj zamiast nazwy wartości z kolumny **Command-Line Friendly ID**.
- Jeśli dźwięk nadal nie wraca, zwiększ pauzy `timeout /t 2` do 3–4 sekund.
- Plik jest zapisany w kodowaniu **UTF-8**, żeby poprawnie obsłużyć polskie znaki w nazwach urządzeń.
- Słuchawki Bluetooth muszą być połączone w momencie uruchomienia skryptu.
