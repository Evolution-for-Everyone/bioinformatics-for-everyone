# الدرس 1: مقدمة في سطر الأوامر و bash  
By: Letícia Magpali

## أهداف التعلم
* [فتح الطرفية](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#1-opening-the-terminal)
* [هيكل الطرفية](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#2-the-structure-of-the-terminal)
* [استخدام bash في الطرفية](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#3-using-bash-in-the--terminal)
* [التنقل بين المجلدات](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#-moving-between-different-directories)
* [إنشاء المجلدات والملفات](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#-creating-directories-and-files)
* [تغيير ونقل الملفات](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#-changing-and-moving-files)
* [التحدي: إنشاء هيكل مجلد](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#4-challenge-creating-a-folder-structure)
* [تثبيت البرمجيات](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#5-installing-software)

## 1. فتح الطرفية

🍄 **ما هي الطرفية؟**  
الطرفية هي واجهة نصية تتواصل مع جهازك من خلال كتابة الأوامر.  
في أنظمة Linux و MacOS، تستخدم الطرفية لغة برمجة تُسمى **bash**.  
يمكنك استخدام الطرفية للقيام بأي شيء تقوم به عادةً على جهازك، مثل تشغيل البرامج، وإنشاء، وتحرير، والوصول إلى الملفات والمجلدات.

> [!TIP]
> _ما المميز في الطرفية؟_  
> إنها تتيح لك تشغيل العديد من البرامج التي لا تمتلك واجهة رسومية!

العديد من البرامج المستخدمة في التحليل في علم الأحياء التطوري لا تملك _واجهة رسومية_، مما يعني أنها لا تمتلك تطبيقًا، أو شاشة، أو أيقونات قابلة للنقر، ويجب التفاعل معها فقط باستخدام لغة البرمجة.

🍄 **أين يمكنني العثور على الطرفية؟**  
تشبه الطرفية تطبيقًا آخر على جهازك، ولكنها ستختلف قليلاً تبعًا لنظام التشغيل (Linux، MacOS أو Windows). اتبع التعليمات أدناه حسب نظامك:

→ **لمستخدمي MacOS/Linux**  
* يمكنك العثور على **الطرفية** ضمن قائمة التطبيقات (launchpad)،  
* أو باستخدام خيار البحث (عادةً بواسطة الضغط على مفتاح F4 الذي يحتوي على رمز العدسة 🔍) ثم كتابة `terminal` في مربع البحث.  
* تبدو أيقونة الطرفية مثل صندوق أسود يحتوي على رموز `<` و`-`، مثل هذا:  
  <img src="https://github.com/user-attachments/assets/8c8aa650-9fb9-4275-a871-a96ea0fa190a" width="200">

→ **لمستخدمي Windows**  
* الطرفية الأصلية في Windows لا تعمل مع **bash**، لذا فهي غير مناسبة لاحتياجاتنا.  
* عند استخدام أجهزة Windows، يجب تثبيت نظام Linux للوصول إلى الطرفية.  
* لذلك، اتبع [هذا الدليل المكتوب](https://learn.microsoft.com/en-us/windows/wsl/install) أو شاهد [هذا الدليل الفيديو](https://www.youtube.com/watch?v=sUsTQTJFmjs&ab_channel=ProgrammingKnowledge).

🐞 بمجرد تحديد مكان الطرفية على جهازك، افتحها! يجب أن تظهر نافذة سوداء بها نص في الأعلى، مثل الصورة التالية:

![Screenshot 2025-03-21 at 5 02 34 PM](https://github.com/user-attachments/assets/d1ca03b0-288d-47b1-879f-471da901e82b)

## 2. هيكل الطرفية

عند فتح الطرفية، سترى المعلومات التالية في الجزء العلوي الأيسر:

``` bash
user@computer directory % # إذا كنت تستخدم MacOS
    
user@computer:directory$ # إذا كنت تستخدم Linux/Unix
```

> [!TIP]
> يُطلق على هذا السطر اسم **prompt**، وهو يشير إلى أن الكمبيوتر جاهز لقبول أوامرك، أي أنه _يطلب منك إدخال أمر_.

🍄 **لنحلل الآن عناصر الـ prompt:**

1️⃣ `user` و`computer` هما الاسمان اللذان قمت بتعيينهما لنفسك ولجهازك.  
على سبيل المثال، <ins>اسمي "letixa" واسم جهازي "eugenio"</ins>. يمكنك تعيين أي اسم تريده!

2️⃣ `directory` هو المجلد الذي تعمل فيه حالياً (المصطلح "directory" يعني مجلد).  
* بعض أنظمة التشغيل تعرض فقط اسم المجلد، بينما تعرض أنظمة أخرى المسار الكامل.
* عند فتح الطرفية، يظهر المجلد كـ `~`، وهو رمز يمثل **المجلد الرئيسي (HOME)**.

3️⃣ `$` أو `%` هو رمز يشير إلى أن الطرفية تنتظر إدخال أمر منك.  
عندما ترى هذا الرمز، يمكنك البدء بكتابة أوامرك!

_ماذا عن الجزء `(base)` الذي يظهر في لقطة الشاشة؟_  
هذا يشير إلى البيئة التي تعمل بها، وسيُشرح ذلك أكثر في المستقبل.

## 3. استخدام bash في الطرفية

> [!IMPORTANT]
> ### **قائمة الأوامر**
> * `pwd` - اطبع المجلد الحالي: يعرض المجلد الذي تعمل فيه حالياً.
> * `cd` - تغيير المجلد: ينتقل إلى مجلد آخر حسب المسار الذي تحدده.
> * `ls` - قائمة: يعرض محتويات المجلد (ملفات، ومجلدات فرعية).
> * `mkdir` - إنشاء مجلد: ينشئ مجلدًا جديدًا.
> * `nano` - محرر نصوص: لإنشاء وتحرير ملفات النصوص.
> * `cat` - دمج: يعرض محتويات ملف أو ملفات.
> * `mv` - نقل: يقوم بنقل أو إعادة تسمية الملفات أو المجلدات.

### 🍄 **التنقل بين المجلدات**

**🐞 أولاً، دعنا نعرف مكان وجودنا** (المجلد الحالي) <br>  
اكتب الأمر `pwd` ثم اضغط Enter <br>  
يجب أن ترى مسارًا مفصولًا بشرطات مائلة، مثل المثال التالي:
    
```bash
(base) letixa@eugenio ~ % pwd   
/Users/letixa
```
    
**هذا المسار يمثل الموقع الكامل للمجلد الذي تعمل فيه حالياً.** <br>
في هذه الحالة، أنا في مجلدي الرئيسي الذي يقع في `/Users/letixa`.

**🐞 ما هي الملفات داخل المجلد الرئيسي؟**  
يمكنك استخدام الأمر `ls` لمعرفة ذلك! <br>
اكتب `ls` ثم اضغط Enter، سترى أسماء الملفات والمجلدات داخل المجلد الرئيسي:
    
```bash
(base) letixa@eugenio ~ % ls
Applications            Library                 Public
Desktop                 Mesquite_Support_Files  Zotero
Documents               Movies                  src
Downloads               Music                   zsh-syntax-highlighting
Google Drive            Pictures
```

**🐞 الآن دعنا ننتقل إلى المجلد الذي نريد العمل فيه!** <br> 
اختر مجلدًا داخل المجلد الرئيسي لتنظيم ملفات الدروس. ثم استخدم الأمر `cd` متبوعًا باسم المجلد للانتقال إليه. <br>
على سبيل المثال، للانتقال إلى مجلد Documents:
    
```bash
(base) letixa@eugenio ~ % cd Documents
(base) letixa@eugenio Documents %
```
   
لاحظ أن المجلد في الـ prompt تغير من `~` إلى `Documents`، مما يعني أنك داخل المجلد الآن!

**🐞 ماذا لو أردت الانتقال إلى مجلد داخل مجلد؟** \
في هذه الحالة، لن يكفي كتابة اسم المجلد فقط لأن الطرفية لن تجد المجلد المطلوب من موقعك الحالي.\
يجب استخدام الأمر `cd` مع المسار الكامل، مثل:
    
```bash
(base) letixa@eugenio ~ % cd Documents/work
(base) letixa@eugenio work %
```
إذا حاولت:
    
```bash
(base) letixa@eugenio ~ % cd work
```
ستظهر رسالة خطأ:
    
```bash
(base) letixa@eugenio ~ % cd work
cd: no such file or directory: work
```

> [!TIP]
> **وهنا نتعلم درساً هاماً في الطرفية:** <br>
> يعمل الأمر فقط إذا كنت في المكان الصحيح!  
> هذا يعني:
> * إذا كان الملف أو المجلد موجودًا في موقعك الحالي، يمكنك كتابة `[أمر] [مسافة] [اسم الملف/المجلد]`
> * لكن إذا كان الملف أو المجلد في موقع آخر، يجب أن تحدد مساره الكامل، أي كتابة `[أمر] [مسافة] [مسار الملف/المجلد]`.

***

### 🍄 **إنشاء المجلدات والملفات**

_الآن وبعد أن أصبحت في المكان المناسب لتخزين دروسك، دعنا ننشئ بعض المجلدات لتنظيم الأمور!_

**🐞 إنشاء مجلد رئيسي** <br>
أولاً، سننشئ مجلدًا رئيسيًا يحتوي على كل ما يتعلق بدروسنا. <br>
استخدم الأمر `mkdir` متبوعًا بالاسم الذي تود إعطاءه للمجلد، مثل:
```bash
mkdir tutorials_2025
```
استخدم `ls` للتحقق من إنشاء المجلد:
```bash
(base) letixa@eugenio Documents % ls
tutorials_2025
```
الآن، ادخل إلى مجلد `tutorials_2025` باستخدام:
```bash
cd tutorials_2025
```
واستخدم `ls` لمعرفة محتويات المجلد؛ يجب أن يكون فارغًا:
```bash
(base) letixa@eugenio tutorials_2025 % ls
```

**🐞 إنشاء ملف README** \
لإنشاء ملف README داخل المجلد الرئيسي، استخدم الأمر `nano`:
```bash
nano README.txt
```
سيظهر لك شاشة سوداء فارغة. اكتب عنوانًا للملف، مثلاً:
```
README - BIOINFORMATICS TUTORIALS 2025
```
ثم استخدم `Ctrl + X`، ثم Y، ثم Enter لحفظ الملف والخروج.

استخدم الأمر `ls` مرة أخرى للتحقق:
```bash
(base) letixa@eugenio tutorials_2025 % ls
README.txt
```

يمكنك تحرير الملف لاحقًا بكتابة:
```bash
nano README.txt
```
لمزيد من المعلومات عن `nano`، شاهد [هذا الفيديو التعليمي](https://www.youtube.com/watch?v=g2PU--TctAM&ab_channel=SavvyNik).

**🐞 لعرض محتويات الملف:** \
استخدم الأمر `cat` متبوعًا باسم الملف:
```bash
cat README.txt
```
ستظهر محتويات الملف مثل:
```bash
(base) letixa@eugenio tutorials_2025 % cat README.txt 
README - BIOINFORMATICS TUTORIALS 2025
```

>[!NOTE]
> للتعمق أكثر في هذا الدرس، حاول كتابة محتويات كاملة لملف README الخاص بك.\
> لمزيد من المعلومات حول كيفية كتابة ملف README، زور [هذه الصفحة](https://www.makeareadme.com/).

***

### 🍄 **تغيير ونقل الملفات**

_هل يمكنني تغيير اسم أو نقل ملف؟_\
نعم! الأمر `mv` يسمح لك بإعادة تسمية ونقل الملفات. دعنا نجرب ذلك:

**🐞 إعادة تسمية الملف:** \
لتغيير اسم ملف README إلى `README_tutorials.txt`، استخدم:
```bash
mv README.txt README_tutorials.txt
```
تحقق من ذلك باستخدام:
```bash
ls
```
على أن يظهر:
```bash
README_tutorials.txt
```

**🐞 نقل الملف:** \
إذا أنشأت الملف في المكان الخطأ، يمكنك نقله باستخدام:
```bash
mv README.txt tutorials_2025
```
ثم انتقل إلى المجلد وتحقق باستخدام:
```bash
cd tutorials_2025
ls
```
يجب أن ترى الملف هناك.

***

## 4. التحدي: إنشاء هيكل مجلد
_يجب أن يكون كل عالم معلوماتية حيوية منظمًا!_ <br>
في هذا التحدي، سننشئ مجلدات لتخزين البيانات والملاحظات والتمارين. <br>
تأكد من أنك داخل مجلد `tutorials_2025` ثم جرب كتابة الأمر بنفسك قبل رؤية الحل أدناه.

🐞 **إنشاء مجلد باسم `sandbox`** <br>
هذا هو المكان الذي يمكنك فيه تجربة الأمور دون التأثير على تحليلك.
<details>
<summary>انقر للكشف عن الأمر</summary>

```bash
mkdir sandbox
```
</details>

🐞 **إنشاء مجلد لكل درس** <br>
يمكنك استخدام أسماء مثل `tutorial_1`, `tutorial_2`, إلخ. يُفضّل استخدام "_" بدلاً من المسافات.
<details>
<summary>انقر للكشف عن الأمر</summary>

```bash
mkdir tutorial_1 tutorial_2 tutorial_3 tutorial_4 tutorial_5 tutorial_6
```
</details>

عند استخدام الأمر `ls`، ينبغي أن ترى شيئًا مثل:
```bash
(base) letixa@eugenio tutorials_2025 % ls
README.txt  tutorial_1  tutorial_3  tutorial_5
sandbox     tutorial_2  tutorial_4  tutorial_6
```

> [!WARNING]
> **إذا واجهت خطأً:** تأكد من:
> * أنك في المجلد الصحيح.
> * كتابة المسارات بشكل صحيح.
> * عدم وجود أخطاء إملائية.
>  
> **تذكر:** أجهزة الكمبيوتر تحتاج تعليمات دقيقة جدًا!

## 5. تثبيت البرمجيات

لنختتم هذا الدرس بتثبيت حزمتين مهمتين لمستقبلك في العمل (ومن الجيد الحصول عليهما):
- **Homebrew**: مدير الحزم لنظام MacOS  
  * اتبع التعليمات على [هذه الصفحة](https://brew.sh/) لتثبيت Homebrew.
- **Git**: مدير المستودعات  
  * يساعدك Git على تتبع التغييرات في ملفاتك مع مرور الزمن، وهو مثالي للعمل الجماعي.

**كيفية تثبيت Git على MacOS:** 
```bash
brew install git 
# يستخدم الأمر Homebrew لتثبيت Git على جهازك
```

**كيفية تثبيت Git على Linux/Unix:** 
```bash
sudo apt-get install git-all
# يستخدم Linux الأمر apt-get لتثبيت العديد من البرامج
```

> [!NOTE]
> يمكنك استخدام الأمر `git --version` لمعرفة نسخة Git المثبتة على جهازك.

