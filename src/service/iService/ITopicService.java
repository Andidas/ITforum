package service.iService;
/**
 * @author ��ΰ��
 * ���ӽӿ�
 */
public interface ITopicService {
	/**
	 * ��������
	 * @param sname session����
	 * @param uname �û�����
	 * @param ttopic ��Ŀ
	 * @param tcontents ����
	 * @return ���ӳɹ�����true
	 */
	public boolean addTopic(String sname,String uname,String ttopic,String tcontents);
	
	/**
	 * ���ϴ����������������������Ű棬����ʾ��session������֮��
	 * @param uname ����
	 * @param ttopic ������Ŀ
	 * @param tcontents ��������
	 * @return �µ��Ű�
	 */
	public String neatenSessionContent(String uname,String ttopic,String tcontents);
}