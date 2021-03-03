package domain;


/**
 * 订单中一项
 */
public class OrderItem {
    @Override
    public String toString() {
        return "OrderItem{" +
                "order_id='" + order_id + '\'' +
                ", product_id='" + product_id + '\'' +
                ", buynum=" + buynum +
                '}';
    }

    private String order_id; // 订单号
    private String product_id; // 商品号
    private int buynum; // 购买数量


    public OrderItem(String order_id, String product_id, int buynum) {
        this.order_id = order_id;
        this.product_id = product_id;
        this.buynum = buynum;
    }

    // 添加product的名称和单价

    public OrderItem(String product_id, int buynum) {
        this.product_id = product_id;
        this.buynum = buynum;
    }

    public String getOrder_id() {
        return order_id;
    }

    public String getProduct_id() {
        return product_id;
    }

    public int getBuynum() {
        return buynum;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public void setBuynum(int buynum) {
        this.buynum = buynum;
    }
}
