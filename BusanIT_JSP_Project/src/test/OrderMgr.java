package test;

import java.util.Vector;

public class OrderMgr {

	
	int aoNum[] = {1,2,3,4,5};
	String aoName[] = {"���", "�����", "�쵿", "���", "�������"};
	String aoStore[] = {"�н���", "����2", "����3", "����4", "����"};
	int aoCount[] = {2,3,1,4,2};
	
	public Vector<OrderBean> getOrder(){
		Vector<OrderBean> vlist = new Vector<>();
		for (int i = 0; i < aoCount.length; i++) {
			OrderBean bean = new OrderBean();
			bean.setoNum(aoNum[i]);
			bean.setoName(aoName[i]);
			bean.setoStore(aoStore[i]);
			bean.setoCount(aoCount[i]);
			vlist.addElement(bean);
		}
		return vlist;
	}

}
