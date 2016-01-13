#define SIZE_X	12
#define SIZE_Y	12

#define LAYER	3   /* �쥤�䡼�������ϡ���֡������ء� */
#define INPUT	(SIZE_X * SIZE_Y + 1) /* �����ؤΥ�˥åȡ����Ͽ���˿� */
#define HIDDEN	8   /* ����ؤΥ�˥åȿ� */
#define OUTPUT	10  /* �����ؤΥ�˥åȿ� */
#define CTG		10    /* �ؽ������ */

#define ITERATIONS	2000   /* �ؽ�����ʽ�λ���1�� */

#define ETA		1.99  /* �ؽ�������0�ʾ塢2.0̤���μ¿���*/
#define ALPHA		0.56  /* �������0�ʾ塢1.0̤���μ¿���*/
#define WD		2.00  /* �Ť߽������ */
#define MIN_ERR	0.0001       /* �Ǿ����ʽ�λ���2��*/

#define ON		0.9
#define OFF		0.1
#define SMAX	15
#define SMIN	-15
#define MAX		0.99995
#define MIN		0.00005

#define PROBLEM		"problem_list.txt"
#define FGETS_LEN 128
