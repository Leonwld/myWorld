import com.alibaba.fastjson.JSON;

import java.net.UnknownHostException;
import java.util.List;

/**
 * Created by Administrator on 2016/4/9.
 */
public class test {
    public static void main(String[] args) throws UnknownHostException {
        String itemIds = "1,2,3,4,5";
        List<Integer> ids = JSON.parseArray(itemIds, Integer.class);
        System.out.print(ids);
    }
}
