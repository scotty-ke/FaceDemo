//
//  OCViewController.m
//  faceTest
//
//  Created by 纳里健康 on 2020/8/12.
//  Copyright © 2020 songk. All rights reserved.
//

#import "OCViewController.h"
#import "son.h"
#import <objc/runtime.h>

@interface OCViewController ()

@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    const int *ptr;
//
//    int i = 10;
//
//    int j = 20;
//
//    ptr = &i;
//
//    ptr = &j;
//
//    NSLog(@"--- %d",*ptr);
    
    son *s = [[son alloc] init];
    
    NSLog(@"实例对象 class== %@",[s class]);
    
    
    
    NSLog(@"类对象 class== %@",[son class]);
    
    
    
    
}

+ (void)classMethod
{
   
}

+ (void)classMethod2
{
//    这里的self是class
    [self classMethod];
}

- (void)instanceMethod
{
    
}



/*
1.分类
 1.1 分类都做了哪些事情
    声明私有方法   分解体积庞大的类文件  把framework的私有方法公开
 
 1.2 分类的特点
    运行时决议 （分类的代码是在运行的时候通过Runtime添加上去的）
    可以为系统类添加分类
 
 1.3 分类可以添加哪些内容
    实例方法  类方法  协议  属性(只是声明了get和set方法，没有添加相应的实例变量)
 
 分类总结：
 1.分类添加的方法可以覆盖原类方法
 2.同名分类方法 最后编译的生效
 3.名字相同的分类会引起编译错误
 
 能否为分类添加"成员变量"
 不能在分类的声明或者定义实现的时候直接添加成员变量，但是可以通过关联对象来添加实例变量
 
 
 扩展
 
 特点：1.编译时决议 2.只以声明的形式存在，多数情况下寄生于宿主类的.m中  3.不能为系统类添加扩展
 
 
 通知
 
 是使用观察者模式来实现的用于跨层传递消息的机制
 传递方式为一对多
 
 如何实现通知机制：

 
 
 
 关联对象
 
 本质：关联对象由AssociationsManager管理并在AssociationHashMap存储
 所有的对象的关联内容都放在一个位置
 
 清除对象的关联对象：将关联对象的值设置成nil

*/

/*
 添加关联对象
void _object_set_associative_reference(id object, void *key, id value, uintptr_t policy) {
    // retain the new value (if any) outside the lock.
    ObjcAssociation old_association(0, nil);
    id new_value = value ? acquireValue(value, policy) : nil;
    {
        AssociationsManager manager;
        AssociationsHashMap &associations(manager.associations());
        disguised_ptr_t disguised_object = DISGUISE(object);
//new_value不为nil的时候，这个时候需要做的就是更新/新建 表中的键值对的过程
         if (new_value) {
            // break any existing association.
            AssociationsHashMap::iterator i = associations.find(disguised_object);
            if (i != associations.end()) {
                // secondary table exists
                ObjectAssociationMap *refs = i->second;
                ObjectAssociationMap::iterator j = refs->find(key);
                if (j != refs->end()) {
                    old_association = j->second;
                    j->second = ObjcAssociation(policy, new_value);
                } else {
                    (*refs)[key] = ObjcAssociation(policy, new_value);
                }
            } else {
                // create the new association (first time).
                //  如果在AssociationsHashMap中没有找个对应的对象，就先需要新建一张ObjectAssociationMap表，来维护对象的新增属性。
                ObjectAssociationMap *refs = new ObjectAssociationMap;
                //将新建的表设置到最外层的AssociationsHashMap中，键为需要查找的对象的地址
                associations[disguised_object] = refs;
                //实例化一个新的ObjcAssociation对象添加到map中
                (*refs)[key] = ObjcAssociation(policy, new_value);
 
                //setHasAssociatedObjects 是用来改变isa_t中第二个标志位has_assoc的值，表示有关联对象
                object->setHasAssociatedObjects();
            }
        } else {
 
 //如果新值为nil,表示需要删除关联对象
 
            // setting the association to nil breaks the association.
            AssociationsHashMap::iterator i = associations.find(disguised_object);
            if (i !=  associations.end()) {
                ObjectAssociationMap *refs = i->second;
                ObjectAssociationMap::iterator j = refs->find(key);
                if (j != refs->end()) {
                    old_association = j->second;
 // 删除
                    refs->erase(j);
                }
            }
        }
    }
    // release the old value (outside of the lock).
// 如果老的关联对象有值，这里还会释放掉老的值
    if (old_association.hasValue()) ReleaseValue()(old_association);
}
*/


/*
 objc_getAssociatedObject方法
 
 两张表 AssociationsHashMap{disguised_object:ObjectAssociationMap}
 ObjectAssociationMap {key:value}
 */

/*
 id _object_get_associative_reference(id object, void *key) {
     id value = nil;
     uintptr_t policy = OBJC_ASSOCIATION_ASSIGN;
     {
         AssociationsManager manager;
         AssociationsHashMap &associations(manager.associations());
         disguised_ptr_t disguised_object = DISGUISE(object);
         AssociationsHashMap::iterator i = associations.find(disguised_object);
         if (i != associations.end()) {
             ObjectAssociationMap *refs = i->second;
             ObjectAssociationMap::iterator j = refs->find(key);
             if (j != refs->end()) {
                 ObjcAssociation &entry = j->second;
                 value = entry.value();
                 policy = entry.policy();
                 if (policy & OBJC_ASSOCIATION_GETTER_RETAIN) ((id(*)(id, SEL))objc_msgSend)(value, SEL_retain);
             }
         }
     }
     if (value && (policy & OBJC_ASSOCIATION_GETTER_AUTORELEASE)) {
         ((id(*)(id, SEL))objc_msgSend)(value, SEL_autorelease);
     }
     return value;
 }
 */


/*
 属性关键字
 
 空指针：指针指向的地址为空的指针叫空指针(NULL指针)

 野指针：是指向“垃圾”内存（不可用内存）的指针
 产生原因：指针创建时未初始化。指针变量刚被创建时不会自动成为NULL指针，它会随机指向一个内存地址。

 悬垂指针：指针所指向的对象已经被释放或者回收了，但是指向该对象的指针没有作任何的修改，仍旧指向已经回收的内存地址。 此类指针称为垂悬指针。

 assign:(既可以修饰对象，也可以修饰基本类型)
        1.修饰基本数据类型
        2.修饰对象类型时，不改变其引用计数
        3.修饰的对象被释放之后，assign指针继续指向原对象地址，会造成悬垂指针.
 
 weak：（修饰对象）
        1.不改变被修饰对象的引用计数
        2.所指的对象在被释放之后会自动置为nil
 
 copy:  可变对象的copy和mutableCopy都是深拷贝
        不可变对象的copy是浅拷贝，mutableCopy是深拷贝
        copy方法返回的都是不可变对象
 
 */

/*
    runtime
    
 
 */

@end
