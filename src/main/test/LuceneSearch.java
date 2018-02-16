import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.SimpleFSDirectory;
import org.apache.lucene.util.Version;

import java.io.File;
import java.io.IOException;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/2/16.
 */
public class LuceneSearch {
    public static void main(String[] args) throws IOException, ParseException {
        // 保存索引文件的地方
        String indexDirectory = "C:\\Users\\ThinKPad\\Desktop\\test\\index";
        // 创建Directory对象 ，也就是分词器对象
        Directory directory = new SimpleFSDirectory(new File(indexDirectory));
        // 创建 IndexSearcher对象，相比IndexWriter对象，这个参数就要提供一个索引的目录就行了
        IndexSearcher indexSearch = new IndexSearcher(directory);
        // 创建QueryParser对象,
        // 第1个参数表示Lucene的版本,
        // 第2个表示搜索Field的字段,
        // 第3个表示搜索使用分词器
        QueryParser queryParser = new QueryParser(Version.LUCENE_30,
                "contents", new StandardAnalyzer(Version.LUCENE_30));
        // 生成Query对象
        Query query = queryParser.parse("百度");
        // 搜索结果 TopDocs里面有scoreDocs[]数组，里面保存着索引值
        TopDocs hits = indexSearch.search(query, 10);
        // hits.totalHits表示一共搜到多少个
        System.out.println("找到了" + hits.totalHits + "个");
        // 循环hits.scoreDocs数据，并使用indexSearch.doc方法把Document还原，再拿出对应的字段的值
        for (int i = 0; i < hits.scoreDocs.length; i++) {
            ScoreDoc sdoc = hits.scoreDocs[i];
            Document doc = indexSearch.doc(sdoc.doc);
            System.out.println(doc.get("filename"));
        }
        indexSearch.close();
    }
}
