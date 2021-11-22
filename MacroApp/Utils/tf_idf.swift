import NaturalLanguage
import Foundation

//class TFIDF {
//    var rawSentences = [String]()
//
//    let stopWords: [String] = ["ajak", "akan", "beliau", "khan", "lah", "dong", "ahh", "sob", "elo", "so", "kena", "kenapa", "yang", "dan", "tidak", "agak", "kata", "bilang", "sejak", "kagak", "cukup", "jua", "cuma", "hanya", "karena", "oleh", "lain", "setiap", "untuk", "dari", "dapat", "dapet", "sudah", "udah", "selesai", "punya", "belum", "boleh", "gue", "gua", "aku", "kamu", "dia", "mereka", "kami", "kita", "jika", "bila", "kalo", "kalau", "dalam", "nya", "atau", "seperti", "mungkin", "sering", "kerap", "acap", "harus", "banyak", "doang", "kemudian", "nyala", "mati", "milik", "juga", "mau", "dimana", "apa", "kapan", "kemana", "selama", "siapa", "mengapa", "dengan", "kalian", "bakal", "bakalan", "tentang", "setelah", "hadap", "semua", "hampir", "antara", "sebuah", "apapun", "sebagai", "di", "tapi", "lainnya", "bagaimana", "namun", "tetapi", "biar", "pun", "itu", "ini", "suka", "paling", "mari", "ayo", "barangkali", "mudah", "kali", "sangat", "banget", "disana", "disini", "terlalu", "lalu", "terus", "trus", "sungguh", "telah", "mana", "apanya", "ada", "adanya", "adalah", "adapun", "agaknya", "agar", "akankah", "akhirnya", "akulah", "amat", "amatlah", "anda", "andalah", "antar", "diantaranya", "antaranya", "diantara", "apaan", "apabila", "apakah", "apalagi", "apatah", "ataukah", "ataupun", "bagai", "bagaikan", "sebagainya", "bagaimanapun", "sebagaimana", "bagaimanakah", "bagi", "bahkan", "bahwa", "bahwasanya", "sebaliknya", "sebanyak", "beberapa", "seberapa", "begini", "beginian", "beginikah", "beginilah", "sebegini", "begitu", "begitukah", "begitulah", "begitupun", "sebegitu", "belumlah", "sebelum", "sebelumnya", "sebenarnya", "berapa", "berapakah", "berapalah", "berapapun", "betulkah", "sebetulnya", "biasa", "biasanya", "bilakah", "bisa", "bisakah", "sebisanya", "bolehkah", "bolehlah", "buat", "bukan", "bukankah", "bukanlah", "bukannya", "percuma", "dahulu", "daripada", "dekat", "demi", "demikian", "demikianlah", "sedemikian", "depan", "dialah", "dini", "diri", "dirinya", "terdiri", "dulu", "enggak", "enggaknya", "entah", "entahlah", "terhadap", "terhadapnya", "hal", "hanyalah", "haruslah", "harusnya", "seharusnya", "hendak", "hendaklah", "hendaknya", "hingga", "sehingga", "ia", "ialah", "ibarat", "ingin", "inginkah", "inginkan", "inikah", "inilah", "itukah", "itulah", "jangan", "jangankan", "janganlah", "jikalau", "justru", "kala", "kalaulah", "kalaupun", "kamilah", "kamulah", "kan", "kau", "kapankah", "kapanpun", "dikarenakan", "karenanya", "ke", "kecil", "kepada", "kepadanya", "ketika", "seketika", "khususnya", "kini", "kinilah", "kiranya", "sekiranya", "kitalah", "kok", "lagi", "lagian", "selagi", "melainkan", "selaku", "melalui", "lama", "lamanya", "selamanya", "lebih", "terlebih", "bermacam", "macam", "semacam", "maka", "makanya", "makin", "malah", "malahan", "mampu", "mampukah", "manakala", "manalagi", "masih", "masihkah", "semasih", "masing", "maupun", "semaunya", "memang", "merekalah", "meski", "meskipun", "semula", "mungkinkah", "nah", "nanti", "nantinya", "nyaris", "olehnya", "seorang", "seseorang", "pada", "padanya", "padahal", "sepanjang", "pantas", "sepantasnya", "sepantasnyalah", "para", "pasti", "pastilah", "per", "pernah", "pula", "merupakan", "rupanya", "serupa", "saat", "saatnya", "sesaat", "aja", "saja", "sajalah", "saling", "bersama", "sama", "sesama", "sambil", "sampai", "sana", "sangatlah", "saya", "sayalah", "se", "sebab", "sebabnya", "tersebut", "tersebutlah", "sedang", "sedangkan", "sedikit", "sedikitnya", "segala", "segalanya", "segera", "sesegera", "sejenak", "sekali", "sekalian", "sekalipun", "sesekali", "sekaligus", "sekarang", "sekitar", "sekitarnya", "sela", "selain", "selalu", "seluruh", "seluruhnya", "semakin", "sementara", "sempat", "semuanya", "sendiri", "sendirinya", "seolah", "sepertinya", "seringnya", "serta", "siapakah", "siapapun", "disinilah", "sini", "sinilah", "sesuatu", "sesuatunya", "suatu", "sesudah", "sesudahnya", "sudahkah", "sudahlah", "supaya", "tadi", "tadinya", "tak", "tanpa", "tentu", "tentulah", "tertentu", "seterusnya", "tiap", "setidaknya", "tidakkah", "tidaklah", "toh", "waduh", "wah", "wahai", "sewaktu", "walau", "walaupun", "wong", "yaitu", "yakni"]
//
//    var rawText = """
//    Assalamualaikum. Agar di WASPADAI!!!! ... Dan segera Melaporkan jika ada Org yg Mengaku dari Fakultas Kedokteran ingin Mengukur/Cek  Gula darah atau Pengambilan Sample darah ... Gratis ... Segera TOLAK dan LAPORKAN... Waspada Dokter Palsu Harap Kesedian anda untuk Bantu Menangkap Mereka dengan Cepat jika Anda menemui Orang-orang yang Berkunjung di depan pintu Anda dan Mereka mengatakan, Mereka berasal dari Fakultas Kedokteran untuk Bantu Mengukur Gula darah secara GRATIS,Segera Informasikan kepada POLISI karena ORANG-ORANG itu adalah Orang yg ingin MENGHANCURKAN INDONESIA.  Mereka Berkunjung Dari Rumah ke Rumah untuk Menyebarkan VIRUS AIDS melalui Alat Suntik yang Mereka bawa,Kabar ini Berkembang setelah *Warga Pasuruan, Jawa Timur* banyak yang terinfeksi Virus AIDS setelah mendapat Cek Gula Darah Gratis dr Org yang mengaku dari Fakultas Kedokteran. Hal yang serupa pun terjadi di daerah Jogya,Ada beberapa Orang yang di duga Terinfeksi AIDS setelah melakukan  Suntik Cek Gula darah untuk Tes Gula darah yang sama di lakukan oleh Orangyang mengaku berasal dari Fakultas Kedokteran. Laporan Warga kepada Kantor ke Polisian pun makin Marak,Masyarakat di minta untuk lebih WASPADA dan segera MELAPOR kepada APARAT POLISI bila ada hal yang SAMA terjadi di Daerah Anda, agar Dapat segera di TANGKAP beserta Barang Buktinya ... Dan ini sdh terjadi di *SDN PATAS Gerokgak Buleleng* tgl 17  juni 2019 jam 09.00. Tetapi Para Guru Curiga karena Mrk Memaksa utk Mengambil Darah, dgn Alasan Mengecek Darah Murid2. Jangan LUPA segera minta KTP Mereka dan Laporkan secepatnya,Agar tidak timbul Korban lebih banyak lagi pada  Anak2,Saudara,Sahabat,Org2 di sekitar Kita
//    """
//
//    // var rawText = """
//    // Viral. skitar 600 siswa/siswi China di DKI di Suntik Vaksin Kosongan utk dapatkan Sertifikat Vaksin dan Barcode. Sementara.., Putra-Putri Pribumi di Vaksin Sungguhan. Ini jelas Strategy Genosida.., Kelak Indonesia akan di Kuasai Mayoritas China.
//
//    // Baca artikel detikinet, "Viral Hoax 600 Pelajar China Diberi Vaksin Kosong di Jakarta" selengkapnya https://inet.detik.com/cyberlife/d-5785575/viral-hoax-600-pelajar-china-diberi-vaksin-kosong-di-jakarta.
//
//    // Download Apps Detikcom Sekarang https://apps.detik.com/detik/
//    // """
//
//
//    rawText.enumerateSubstrings(in: rawText.startIndex..., options: [.localized, .bySentences]) { (tag, _, _, _) in
//        rawSentences.append(tag?.lowercased() ?? "")
//    }
//
//    func sentences2ArrayOfWords(sentences: [String]) -> [[String]]{
//        var arrayOfWordInSentences = [[String]]()
//        for sentence in sentences {
//            var words = [String]()
//            let tokenizer = NLTokenizer(unit: .word)
//            tokenizer.string = sentence
//            tokenizer.enumerateTokens(in: sentence.startIndex..<sentence.endIndex) { tokenRange, _ in
//                let word = String(sentence[tokenRange])
//                for stopWord in stopWords {
//                    if stopWord != word {
//                        words.append(word)
//                    }
//                }
//                return true
//            }
//            arrayOfWordInSentences.append(words)
//        }
//        return arrayOfWordInSentences
//    }
//
//
//    //Calculate TF
//    func calcTf(document: [String]) -> [String: Float] {
//        var TF_dict = [String: Float]()
//
//        for term in document {
//            let isKeyExist = TF_dict[String(term)] != nil
//            if isKeyExist {
//                TF_dict[String(term)]! += 1
//            } else {
//                TF_dict[String(term)] = 1
//            }
//        }
//
//        for (key, _) in TF_dict {
//            TF_dict[String(key)] = TF_dict[String(key)]! / Float(document.count)
//        }
//
//        return TF_dict
//    }
//
//
//    //Calculate DF
//    func calcDF(tfDict: [[String: Float]]) -> [String: Float] {
//        var countDF = [String: Float]()
//        for document in tfDict {
//            for term in document {
//                let isKeyExist = countDF[term.key] != nil
//                if isKeyExist {
//                    countDF[term.key]! += 1
//                } else {
//                    countDF[term.key] = 1
//                }
//
//            }
//        }
//        return countDF
//    }
//
//
//    //Calculate IDF
//    func calcIDF(nDocument: Int, df: [String: Float]) -> [String: Float] {
//        var idfDict = [String: Float]()
//        for term in df {
//            idfDict[term.key] = logf(Float(nDocument) / (df[term.key]! + 1))
//        }
//        return idfDict
//    }
//
//    //Calculate TFIDF
//    func calcTfIdf(TF: [String: Float], IDF: [String: Float]) -> [String: Float] {
//        var tfIdfDict = [String: Float]()
//        for term in TF {
//            tfIdfDict[term.key] = TF[term.key]! * IDF[term.key]!
//        }
//        return tfIdfDict
//    }
//
//
//    //Calculate TFIDF VECTOR
//    func calcTFIDFVec(tfIdfDict: [String: Float], uniqueTerm: [String]) -> [Float] {
//        var tfIdfVec = [Float]()
//        for _ in 1...uniqueTerm.count {
//            tfIdfVec.append(Float(0))
//        }
//
//        var initVal = 0
//        for term in uniqueTerm {
//            let isKeyExist = tfIdfDict[term] != nil
//            if isKeyExist {
//                tfIdfVec[initVal] = tfIdfDict[term]!
//            }
//            initVal += 1
//        }
//        return tfIdfVec
//    }
//
//    var dictOfWordInSentences = sentences2ArrayOfWords(sentences: rawSentences)
//    var dictOfTF = [[String: Float]]()
//    var nDocument = dictOfWordInSentences.count
//    var initValue = 0
//
//    for document in dictOfWordInSentences {
//        let tf_dict = calcTf(document: document)
//        dictOfTF.append(tf_dict)
//    }
//
//    var dictOfDf = calcDF(tfDict: dictOfTF)
//    var dictOfIdf = calcIDF(nDocument: nDocument, df: dictOfDf)
//
//    var dictOfTFIDF = [[String: Float]]()
//
//    for document in dictOfTF {
//        dictOfTFIDF.append(calcTfIdf(TF: document, IDF: dictOfDf))
//    }
//
//    var sortedDF = dictOfDf.sorted {
//        return $0.value > $1.value
//    }
//
//    // get 20 teratas
//    var uniqueTerm = [String]()
//    initValue = 0
//    for term in sortedDF {
//        if initValue > 19 {
//            break
//        }
//        uniqueTerm.append(term.key)
//        initValue += 1
//    }
//
//    //vector
//    var tfIdfVec = [[String: [Float]]]()
//    initValue = 0
//    for documents in dictOfTFIDF {
//        var initVec = [String: [Float]]()
//        for document in documents {
//            initVec[document.key] = calcTFIDFVec(tfIdfDict: documents, uniqueTerm: uniqueTerm)
//        }
//        tfIdfVec.append(initVec)
//        initValue += 1
//    }
//
//    var rawRanking = [String: Float]()
//    for terms in tfIdfVec {
//        var rankingValue: Float = Float(0.0)
//        for dict in terms {
//            for i in dict.value {
//                rankingValue += i
//            }
//            rawRanking[String(dict.key)] = rankingValue
//        }
//    }
//
//
//
//    var ranking = [String: Float]()
//    for i in uniqueTerm {
//        let isKeyExist = rawRanking[i] != nil
//        if isKeyExist {
//            ranking[String(i)] = rawRanking[String(i)]
//        }
//    }
//
//    var sortedRanking = ranking.sorted {
//        return $0.value > $1.value
//    }
//
//
//    print("term \t \t \t ranking ")
//    print("---- \t \t \t ------ ")
//    for (key, value) in sortedRanking {
//        print("\(key) \t \t \t \(value)")
//    }
//
//
//
//}
