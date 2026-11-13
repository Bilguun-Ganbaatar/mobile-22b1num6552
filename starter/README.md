# ShopLite — Мобайл апп хөгжүүлэлт (Flutter)

**Нэр:** …  
**Оюутны код:** …

Энэ репозиторид 6 долоо хоногийн турш бүх лабораторийн кодоо хадгална.

```
├── README.md          ← энэ файл (доорх хэсгүүдийг бөглөнө)
├── screenshots/       ← дэлгэцийн зураг
├── lab1_dart/         ← Лаборатори 1: Dart дасгал
└── shoplite/          ← Лаборатори 1-д `flutter create`-оор үүсгэнэ
```

## Код хадгалах (лаборатори бүрийн төгсгөлд)

```bash
git add .
git commit -m "Lab 1: Dart модель, shoplite апп"
git push
git tag v0.1            # Лаб 1 → v0.1, Лаб 2 → v0.2, ...
git push origin v0.1
```

Push хийсний дараа GitHub дээрх **Actions** табаас автомат тестийн үр дүнг (ногоон ✓ / улаан ✗) харна.
`lab1_dart/test/` болон `.github/` хавтасны файлуудыг **өөрчлөхгүй**.

---

## Лаборатори 1

![flutter doctor](screenshots/flutter_doctor.png)
![shoplite](screenshots/shoplite.png)

### lab1_dart

- `dart test test/lab1_test.dart`: … / 25
- Бонус B1 (`dart test test/bonus_test.dart`): хийсэн / хийгээгүй

### D2. Flutter төслийн бүтэц

**1. lib/main.dart-д ямар классууд байна? Аль нь StatelessWidget, аль нь StatefulWidget вэ?**

main.dart файлд ShopLiteApp, CartPage, \_CartPageState классууд байна.

ShopLiteApp нь StatelessWidget бөгөөд аппын үндсэн тохиргоо, Theme болон эхлэх дэлгэцийг тодорхойлдог.

CartPage нь StatefulWidget бөгөөд сагсны тоо өөрчлөгдөх боломжтой. \_CartPageState нь тоолуур болон товчнуудын ажиллагааг удирддаг.

**2. pubspec.yaml-д ямар сангууд байна вэ?**

dependencies:

- flutter: Flutter апп хөгжүүлэх үндсэн сан.
- cupertino_icons: iOS загварын icon ашиглах сан.

dev_dependencies:

- flutter_test: Flutter аппын widget test хийх сан.
- flutter_lints: Кодын бичлэгийн дүрэм болон алдааг шалгах сан.

**3. android/ хавтас юунд хэрэгтэй вэ? Аль хавтсанд код бичих вэ?**

android/ хавтас нь Flutter аппыг Android төхөөрөмж дээр build хийхэд хэрэгтэй тохиргоо болон платформын файлуудыг агуулдаг.

Flutter аппын үндсэн кодыг lib/ хавтсанд бичнэ. Харин test/ хавтсанд тестийн кодыг бичдэг.

### D4. Hot reload ба hot restart

| Өөрчлөлт              | Hot reload (r)                          | Hot restart (R)                     |
| --------------------- | --------------------------------------- | ----------------------------------- |
| AppBar-ийн гарчиг     | Гарчиг өөрчлөгдөж, тоолуур хадгалагдсан | Гарчиг өөрчлөгдөж, тоолуур 0 болсон |
| Theme өнгө            | Өнгө өөрчлөгдөж, тоолуур хадгалагдсан   | Өнгө өөрчлөгдөж, тоолуур 0 болсон   |
| \_count = 5           | Өмнөх утга хэвээр үлдсэн                | Тоолуур 5 болсон                    |
| main() print('start') | start хэвлэгдээгүй                      | start хэвлэгдсэн                    |

**Дүгнэлт:** Hot Reload нь өөрчлөлтийг шууд харуулж, State-ийг хадгалдаг. Hot Restart нь аппыг дахин эхлүүлж, State-ийг анхны утгад нь буцаадаг.
