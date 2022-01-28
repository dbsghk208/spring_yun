package shopping.bean;

import lombok.Data;

@Data
public class PracShoppingDTO {
	private String productCode;
	private String productName;
	private String category;
	private String productOption;
	private int productUnit;
	private int productRate;
	private int enterCount;
	private int sellCount;
	private int wishCount;
	private String productImageName;
	private String productEngName;
	private String productSmallInfo;
	private String productDetailInfo; 
	
}
